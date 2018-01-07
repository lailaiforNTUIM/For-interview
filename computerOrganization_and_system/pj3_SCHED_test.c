#define _GNU_SOURCE

#include <pthread.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <errno.h>
#include <sched.h>
#include <sys/syscall.h>

#define SCHED_NORMAL		0
#define SCHED_WEIGHTED_RR   6

#define SYS_weighted_rr_getquantum 337
#define SYS_weighted_rr_setquantum 338

#define CHARCODE_OF_A 65

struct thread_args {
	int tid;
	char mychar;
};

int sched_policy, num_threads;
int quantum, old_quantum;
int current_number, total_number;
long *counts;
pthread_t *threads;

void *run(void *arg) {
	int i;
	struct thread_args *my_args = (struct thread_args*) arg;
	
	// add 1
	while(1){
		if(current_number > total_number){
			break;
		}

		*(counts + my_args->tid) += 1;

		__sync_fetch_and_add(&current_number, 1);
	}

	free(my_args);
	pthread_exit(NULL);
}

int main(int argc, char *argv[]){
	struct sched_param param;
	struct thread_args *targs;
	pthread_attr_t attr;
	int i;
	
	if(argc != 4){
		perror("Invalid arguments count\n");
		exit(-1);
	}

	// not yet implemented (set CPU affinity)
	cpu_set_t mask;
	CPU_ZERO(&mask);
	CPU_SET(0,&mask);
	sched_setaffinity(0,sizeof(mask),&mask);
	// ...
	
	// parse arguments
	if(strcmp(argv[1], "SCHED_NORMAL") == 0){
		sched_policy = SCHED_NORMAL;
	}
	else if(strcmp(argv[1], "SCHED_FIFO") == 0){
		// not yet implemented (set this process's scheduling policy to SCHED_FIFO)
		sched_policy=1;
		// ...
	}
	else if(strcmp(argv[1], "SCHED_RR") == 0){
		// not yet implemented (set this process's scheduling policy to SCHED_RR)
		sched_policy=2;
		// ...
	}
	else if(strcmp(argv[1], "SCHED_WEIGHTED_RR") == 0){
		// not yet implemented (set this process's scheduling policy to SCHED_WEIGHTED_RR)
		sched_policy=6;
		// ...

		old_quantum = syscall(SYS_weighted_rr_getquantum);
		quantum = old_quantum;
	}
	else{
		perror("Invalid scheduling policy\n");
		exit(-1);
	}
	
	num_threads = atoi(argv[2]);
	total_number = atoi(argv[3]);
	current_number = 0;

	counts = malloc(num_threads * sizeof(long));
	//LOOK HERE
	param.sched_priority=sched_get_priority_max(sched_policy);
	sched_setscheduler(0,sched_policy,&param);

	// create and start each thread
	if((threads = malloc(num_threads * sizeof(pthread_t))) == NULL){
		perror("malloc(num_threads) fail\n");
		exit(-1);
	}
		
	pthread_attr_init(&attr);
	pthread_attr_setdetachstate(&attr, PTHREAD_CREATE_JOINABLE);

	for(i = 0; i < num_threads; i++){
		*(counts + i) = 0;
		targs = malloc(sizeof(struct thread_args));
		targs->tid = i;
		targs->mychar = (char) (CHARCODE_OF_A + i);

		pthread_create(&threads[i], &attr, run, (void *)targs);

		if(sched_policy == SCHED_WEIGHTED_RR){
			syscall(SYS_weighted_rr_setquantum, quantum);
			quantum *= 2;
		}
	}

	// wait for all threads to complete
	for (i = 0; i < num_threads; i++) {
		pthread_join(threads[i], NULL);
	}

	for (i = 0; i < num_threads; i++) {
		printf("Thread %d counts: %ld\n", i, *(counts + i));
	}
	
	// reset time quantum
	syscall(SYS_weighted_rr_setquantum, old_quantum);

	// clean up and exit
	pthread_attr_destroy(&attr);
	pthread_exit (NULL);
}
