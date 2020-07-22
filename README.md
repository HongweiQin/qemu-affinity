# qemu-affinity

## Prepare

Modify the linux boot cmd line parameter. E.g.,

```
isolcpus=15-47
```

## Run QEMU Emulator

sudo xxx

## Check The PIDs of QEMU Threads.

Only check child threads.

```
./qemu-affinity
```

## Set Affinity For QEMU Threads.

E.g.

```
sudo ./qemu-affinity 33 15
```

Not all threads need to be touched. Read the scripts and do some VM stress experiments FMI.

