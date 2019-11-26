#!/usr/bin/env python

from mpi4py import MPI

comm = MPI.COMM_WORLD
rank = comm.Get_rank()

if rank == 0:
    data = {'a': 7, 'b': 3.14}
    comm.send(data, dest=1, tag=11)
elif rank == 1:
    data = comm.recv(source=0, tag=11)

assert comm.Get_size() > 1

if rank == 1:
    assert data['a'] == 7

if rank > 1:
    assert 'data' not in locals()
