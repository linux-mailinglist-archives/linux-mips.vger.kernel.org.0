Return-Path: <linux-mips+bounces-13972-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yPmNHnn2xmkGQwUAu9opvQ
	(envelope-from <linux-mips+bounces-13972-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 27 Mar 2026 22:28:25 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D1A34BB46
	for <lists+linux-mips@lfdr.de>; Fri, 27 Mar 2026 22:28:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F099D30078F5
	for <lists+linux-mips@lfdr.de>; Fri, 27 Mar 2026 21:27:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 896BE37FF4D;
	Fri, 27 Mar 2026 21:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=openadk.org header.i=@openadk.org header.b="F17yNlR2"
X-Original-To: linux-mips@vger.kernel.org
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0F637A4BE;
	Fri, 27 Mar 2026 21:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.238.66.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774646840; cv=none; b=RvrdOIeYWpTKjs9QpW8JO5yduJUpeHDaJvvsriUDgbKd9H3XiBj6BoWHKAiCR17Zmu8IV8ARLZrNp35uCjrIz542zcUeglNHAmxaaDiq4FMsasUiFTksJU9qsDIhKm5sRC8HjRbhyd7SSmwNr1a36A35NU5LqMpM1Ufoog+waww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774646840; c=relaxed/simple;
	bh=MT6rDDI6O1xgITrb0A5torbzog9tyjjmaTD8Jmx4ZZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VLO9+8r1F90gITWIA2rrtkLQZh9T4df9Wg4OCNa1j9O3NRX4suCO/R2fo5+PM+IZ/nHl5mdO5ui/MFHcPN4pLLMYPEzOo2U+z291SHsjK4DL9W97amus+Q7wE6PFUHizMALre6xOvH7gJUs+7tpX8EpvOTSnTuReCxdfrZRbTt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openadk.org; spf=pass smtp.mailfrom=openadk.org; dkim=fail (0-bit key) header.d=openadk.org header.i=@openadk.org header.b=F17yNlR2 reason="key not found in DNS"; arc=none smtp.client-ip=89.238.66.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openadk.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openadk.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=openadk.org; s=2022;
	t=1774646417; bh=MT6rDDI6O1xgITrb0A5torbzog9tyjjmaTD8Jmx4ZZY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F17yNlR2rewcqMDcfPpbzrxITz90MZ8RfPpIqWQkBovrm0ip6J7tcK8wYruXnOtYt
	 DJCxdjKC+lgBCCizP01OUzsG1ci0k6EgZAuyBqIyV6d0OKFC7UQoN8NHh3LK6YS1eO
	 SCAKi9JOVXyeNJABMZaE/Zak/lBhNlu0k0JX8mk+WAbOED2puNFtEvYGM8rlRV6Ylu
	 lbWURxtAQ4uTvh2WKn9Y2UX9ag6qOk2GWYjKAUttacvGp3KJNkMmPG4DoqXTHxuCoQ
	 06/kLNhwBiVlf+t061lRZH1UcdxDSXDR/3V4LCgC715Csqhi9R8mh2eNyeRGNxFTtB
	 7L4eC392VaQGg==
Received: by helium.openadk.org (Postfix, from userid 1000)
	id 27F9D31E0CDE; Fri, 27 Mar 2026 22:20:16 +0100 (CET)
Date: Fri, 27 Mar 2026 22:20:16 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Thomas Huth <thuth@redhat.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Waldemar Brodkorb <wbx@openadk.org>, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] MIPS: Avoid a TLB shutdown induced by a hidden TLB
 entry bit
Message-ID: <acb0kLP74BrCMfYs@waldemar-brodkorb.de>
References: <alpine.DEB.2.21.2603271406020.60268@angie.orcam.me.uk>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="+d3DKV7c4yq6zleZ"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2603271406020.60268@angie.orcam.me.uk>
X-Operating-System: Linux 6.12.63+deb13-amd64 x86_64
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13972-lists,linux-mips=lfdr.de];
	DMARC_NA(0.00)[openadk.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	R_DKIM_PERMFAIL(0.00)[openadk.org:s=2022];
	FREEMAIL_CC(0.00)[alpha.franken.de,bootlin.com,redhat.com,linaro.org,gmail.com,flygoat.com,openadk.org,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:+];
	HAS_ATTACHMENT(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wbx@openadk.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[openadk.org:~];
	TAGGED_RCPT(0.00)[linux-mips];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_SPAM(0.00)[1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,fluor:email,openadk.org:email]
X-Rspamd-Queue-Id: C9D1A34BB46
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--+d3DKV7c4yq6zleZ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi,
Maciej W. Rozycki wrote,

> Hi,
> 
>  This is a reimplementation of initial TLB entry uniquification so as to 
> address an issue with processors that implement a hidden TLB entry bit 
> triggered by commit 9f048fa48740 ("MIPS: mm: Prevent a TLB shutdown on 
> initial uniquification") for platforms that hand the TLB over unchanged 
> from reset.
> 
>  This has been verified across the following systems:
> 
> - DECstation 5000/150, R4000SC MIPS III CPU, SEGBITS == 40, 48-entry TLB, 
>   32-bit kernel,
> 
> - Broadcom BCM91250A, BCM1250 MIPS64 CPU, SEGBITS == 44, 64-entry TLB, 
>   64-bit kernel,
> 
> - MIPS Malta, 74Kf MIPS32r2 CPU, SEGBITS == 31, 64-entry TLB, 32-bit 
>   kernel.
> 
> A debug change was used to verify the TLB is initialised as expected.
> 
>  See individual commit descriptions for details.
> 
>  I consider this code ready to use, but given the diversity of TLB designs 
> with MIPS architecture processors I will appreciate verification across 
> various actual hardware, particularly in preparation for backporting, as 
> this addresses a serious regression for a subset of systems.
> 
>  Please apply otherwise.  Thank you for patience waiting for this fix.
> 
>   Maciej
> 

I tested following three devices with success:
Mikrotik RB532
Linksys WRT54GS v1.0
Microchip PIC32MZ Graphics (DA) Starter Kit

I have attached the dmesg output.

For Microchip I had to revert commit ec7c2a107a59a60079eff3308e791a3441231f2e.
It seems there is a Kconfig naming conflict.
I use:
CONFIG_BUILTIN_DTB_NAME="pic32mzda_sk"
CONFIG_BUILTIN_DTB=y
CONFIG_MIPS_NO_APPENDED_DTB=y

Furthermore I had to recognize that ethernet is not working in
Linux, just in u-boot. But that is unrelated to the patches.

You can add my 
Tested-by: Waldemar Brodkorb <wbx@openadk.org>
to the patch series.

best regards and thanks very much,
 Waldemar

--+d3DKV7c4yq6zleZ
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment; filename="rb532.txt"

[    0.000000] Linux version 7.0.0-rc5+ (wbx@fluor) (mipsel-openadk-linux-uclibc-gcc (GCC) 15.2.0, GNU ld (GNU Binutils) 2.46.0.20260210) #1 Fri Mar 27 20:44:56 CET 2026
[    0.000000] CPU0 revision is: 0001800a (MIPS 4Kc)
[    0.000000] User-defined physical RAM map overwrite
[    0.000000] Primary instruction cache 8kB, VIPT, 4-way, linesize 16 bytes.
[    0.000000] Primary data cache 8kB, 4-way, VIPT, no aliases, linesize 16 bytes
[    0.000000] Zone ranges:
[    0.000000]   Normal   [mem 0x0000000000000000-0x0000000001ffffff]
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000000000000-0x0000000001ffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000000000000-0x0000000001ffffff]
[    0.000000] pcpu-alloc: s0 r0 d32768 u32768 alloc=1*32768
[    0.000000] pcpu-alloc: [0] 0 
[    0.000000] Kernel command line: console=ttyS0,115200 gpio=16383 mem=32M kmac=00:0C:42:0A:7D:D3 board=500 boot=1   console=ttyS0,115200 rw root=/dev/nfs ip=dhcp
[    0.000000] korina mac = 00:0C:42:0A:7D:D3
[    0.000000] Unknown kernel command line parameters "gpio=16383 board=500 boot=1", will be passed to user space.
[    0.000000] printk: log buffer data + meta data: 131072 + 409600 = 540672 bytes
[    0.000000] Dentry cache hash table entries: 4096 (order: 2, 16384 bytes, linear)
[    0.000000] Inode-cache hash table entries: 2048 (order: 1, 8192 bytes, linear)
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 8192
[    0.000000] mem auto-init: stack:all(zero), heap alloc:off, heap free:off
[    0.000000] SLUB: HWalign=16, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
[    0.000000] NR_IRQS: 256
[    0.000000] Initializing IRQ's: 168 out of 256
[    0.000000] calculating r4koff... 
[    0.000000] 000c34f8(799992)
[    0.000000] CPU frequency 400.00 MHz
[    0.000000] clocksource: MIPS: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 9556397797 ns
[    0.000010] sched_clock: 32 bits at 200MHz, resolution 5ns, wraps every 10737525757ns
[    0.000238] Calibrating delay loop... 397.82 BogoMIPS (lpj=795648)
[    0.032129] pid_max: default: 32768 minimum: 301
[    0.033313] Mount-cache hash table entries: 1024 (order: 0, 4096 bytes, linear)
[    0.033431] Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes, linear)
[    0.035244] VFS: Finished mounting rootfs on nullfs
[    0.044672] Memory: 26788K/32768K available (3508K kernel code, 540K rwdata, 488K rodata, 188K init, 188K bss, 5248K reserved, 0K cma-reserved)
[    0.046628] devtmpfs: initialized
[    0.055493] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
[    0.055661] posixtimers hash table entries: 512 (order: 0, 2048 bytes, linear)
[    0.055769] futex hash table entries: 256 (4096 bytes on 1 NUMA nodes, total 4 KiB, linear).
[    0.062846] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.064615] gpio gpiochip0: Static allocation of GPIO base is deprecated, use dynamic allocation.
[    0.067316] PCI: Initializing PCI
[    0.073982] SCSI subsystem initialized
[    0.074986] libata version 3.00 loaded.
[    0.078000] PCI host bridge to bus 0000:00
[    0.078065] pci_bus 0000:00: root bus resource [mem 0x50000000-0x5fffffff]
[    0.078159] pci_bus 0000:00: root bus resource [io  0x18800000-0x188fffff]
[    0.078244] pci_bus 0000:00: No busn resource found for root bus, will use [bus 00-ff]
[    0.078396] pci 0000:00:00.0: [111d:0000] type 00 class 0x000000 conventional PCI endpoint
[    0.078532] pci 0000:00:00.0: BAR 0 [mem 0x00000000-0x07ffffff pref]
[    0.078626] pci 0000:00:00.0: [Firmware Bug]: BAR 1: invalid; can't size
[    0.078687] pci 0000:00:00.0: [Firmware Bug]: BAR 2: invalid; can't size
[    0.105754] pci 0000:00:02.0: [1106:3106] type 00 class 0x020000 conventional PCI endpoint
[    0.105907] pci 0000:00:02.0: BAR 0 [io  0x0000-0x00ff]
[    0.106000] pci 0000:00:02.0: BAR 1 [mem 0x00000000-0x000000ff]
[    0.106192] pci 0000:00:02.0: supports D1 D2
[    0.106255] pci 0000:00:02.0: PME# supported from D1 D2 D3hot D3cold
[    0.107022] pci 0000:00:03.0: [1106:3106] type 00 class 0x020000 conventional PCI endpoint
[    0.107175] pci 0000:00:03.0: BAR 0 [io  0x0000-0x00ff]
[    0.107268] pci 0000:00:03.0: BAR 1 [mem 0x00000000-0x000000ff]
[    0.107460] pci 0000:00:03.0: supports D1 D2
[    0.107524] pci 0000:00:03.0: PME# supported from D1 D2 D3hot D3cold
[    0.108282] pci 0000:00:04.0: [13a3:0020] type 00 class 0x0b4000 conventional PCI endpoint
[    0.108435] pci 0000:00:04.0: BAR 0 [mem 0x00000000-0x00000fff]
[    0.108530] pci 0000:00:04.0: BAR 1 [mem 0x00000000-0x00001fff]
[    0.108620] pci 0000:00:04.0: BAR 2 [mem 0x00000000-0x00007fff]
[    0.588562] pci_bus 0000:00: busn_res: [bus 00-ff] end is updated to 00
[    0.588709] pci 0000:00:04.0: BAR 2 [mem 0x50000000-0x50007fff]: assigned
[    0.588828] pci 0000:00:04.0: BAR 1 [mem 0x50008000-0x50009fff]: assigned
[    0.588945] pci 0000:00:04.0: BAR 0 [mem 0x5000a000-0x5000afff]: assigned
[    0.589061] pci 0000:00:02.0: BAR 0 [io  0x18800000-0x188000ff]: assigned
[    0.589178] pci 0000:00:02.0: BAR 1 [mem 0x5000b000-0x5000b0ff]: assigned
[    0.589295] pci 0000:00:03.0: BAR 0 [io  0x18800400-0x188004ff]: assigned
[    0.589411] pci 0000:00:03.0: BAR 1 [mem 0x5000b100-0x5000b1ff]: assigned
[    0.590168] clocksource: Switched to clocksource MIPS
[    0.599236] NET: Registered PF_INET protocol family
[    0.600633] IP idents hash table entries: 2048 (order: 2, 16384 bytes, linear)
[    0.603760] tcp_listen_portaddr_hash hash table entries: 1024 (order: 0, 4096 bytes, linear)
[    0.603892] Table-perturb hash table entries: 65536 (order: 6, 262144 bytes, linear)
[    0.604075] TCP established hash table entries: 1024 (order: 0, 4096 bytes, linear)
[    0.604202] TCP bind hash table entries: 1024 (order: 1, 8192 bytes, linear)
[    0.604384] TCP: Hash tables configured (established 1024 bind 1024)
[    0.604779] UDP hash table entries: 256 (order: 1, 8192 bytes, linear)
[    0.604941] UDP-Lite hash table entries: 256 (order: 1, 8192 bytes, linear)
[    0.606001] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    0.608962] RPC: Registered named UNIX socket transport module.
[    0.609013] RPC: Registered udp transport module.
[    0.609042] RPC: Registered tcp transport module.
[    0.609071] RPC: Registered tcp-with-tls transport module.
[    0.609102] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    0.609236] PCI: CLS 16 bytes, default 16
[    0.612112] workingset: timestamp_bits=30 max_order=13 bucket_order=0
[    0.617716] Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
[    0.625095] printk: legacy console [ttyS0] disabled
[    0.626676] serial8250.0: ttyS0 at MMIO 0x18058000 (irq = 104, base_baud = 12499875) is a 16550A
[    0.626876] printk: legacy console [ttyS0] enabled
[    1.305205] scsi host0: pata-rb532-cf
[    1.310727] ata1: PATA max PIO4 irq 149 lpm-pol 0
[    1.320391] eth0: korina-0.20 15Sep2017
[    1.325285] via-rhine 0000:00:02.0: enabling device (0080 -> 0083)
[    1.339809] via-rhine 0000:00:02.0 eth1: VIA Rhine III at (ptrval), 00:0c:42:0a:7d:d4, IRQ 142
[    1.350430] via-rhine 0000:00:02.0 eth1: MII PHY found at address 1, status 0x7849 advertising 05e1 Link 0000
[    1.362750] via-rhine 0000:00:03.0: enabling device (0080 -> 0083)
[    1.377589] via-rhine 0000:00:03.0 eth2: VIA Rhine III at (ptrval), 00:0c:42:0a:7d:d5, IRQ 143
[    1.388185] via-rhine 0000:00:03.0 eth2: MII PHY found at address 1, status 0x7849 advertising 05e1 Link 0000
[    1.400158] rc32434_wdt: Stopped watchdog timer
[    1.406329] rc32434_wdt: Watchdog Timer version 1.0, timer margin: 20 sec
[    1.415333] NET: Registered PF_PACKET protocol family
[    1.481057] korina korina eth0: link up, 100Mbps, full-duplex, lpa 0xFFFFFF6F
[    1.506321] Sending DHCP requests ., OK
[    1.534742] IP-Config: Got DHCP answer from 192.168.1.254, my address is 192.168.1.9
[    1.543528] IP-Config: Complete:
[    1.547275]      device=eth0, hwaddr=00:0c:42:0a:7d:d3, ipaddr=192.168.1.9, mask=255.255.255.0, gw=192.168.1.254
[    1.558747]      host=192.168.1.9, domain=, nis-domain=(none)
[    1.565290]      bootserver=192.168.1.254, rootserver=192.168.1.254, rootpath=/srv/nfs/rb532,nfsvers=3
[    1.565365]      nameserver0=192.168.1.254
[    1.665374] VFS: Mounted root (nfs filesystem) on device 0:14.
[    1.672918] devtmpfs: mounted
[    1.676455] VFS: Pivoted into new rootfs
[    1.681299] Freeing unused kernel image (initmem) memory: 188K
[    1.687380] This architecture does not have kernel memory protection.
[    1.694077] Run /sbin/init as init process
[    1.698478]   with arguments:
[    1.698537]     /sbin/init
[    1.698596]   with environment:
[    1.698647]     HOME=/
[    1.698705]     TERM=linux
[    1.698762]     gpio=16383
[    1.698821]     board=500
[    1.698879]     boot=1
[    1.733382] process '/bin/busybox' started with executable stack
Linux openadk 7.0.0-rc5+ #1 Fri Mar 27 20:44:56 CET 2026 mips GNU/Linux
system type		: Mikrotik RB532
machine			: Unknown
processor		: 0
cpu model		: MIPS 4Kc V0.10
BogoMIPS		: 397.82
wait instruction	: yes
microsecond timers	: yes
tlb_entries		: 16
extra interrupt vector	: yes
hardware watchpoint	: yes, count: 1, address/irw mask: [0x0fff]
isa			: mips1 mips2 mips32r1
ASEs implemented	:
Options implemented	: tlb 4kex 4k_cache prefetch mcheck ejtag llsc nan_legacy nan_2008 mm_full
shadow register sets	: 1
kscratch registers	: 0
package			: 0
core			: 0
VCED exceptions		: not available
VCEI exceptions		: not available


--+d3DKV7c4yq6zleZ
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment; filename="pic32.txt"

## Loading kernel from FIT Image at 88500000 ...
   Using 'conf0' configuration
   Trying 'kernel' kernel subimage
     Description:  Linux kernel
     Created:      2026-03-27  20:58:48 UTC
     Type:         Kernel Image
     Compression:  lzma compressed
     Data Start:   0x885000d0
     Data Size:    1574291 Bytes = 1.5 MiB
     Architecture: MIPS
     OS:           Linux
     Load Address: 0x88000000
     Entry Point:  0x88000000
   Verifying Hash Integrity ... OK
## Loading fdt from FIT Image at 88500000 ...
   Using 'conf0' configuration
   Trying 'fdt' fdt subimage
     Description:  PIC32 board DTB
     Created:      2026-03-27  20:58:48 UTC
     Type:         Flat Device Tree
     Compression:  uncompressed
     Data Start:   0x88680708
     Data Size:    7311 Bytes = 7.1 KiB
     Architecture: MIPS
     Hash algo:    sha256
     Hash value:   887d5c29c9694c060696874a30c2ea40370bbc36ca468502a2b760e4bf425022
   Verifying Hash Integrity ... sha256+ OK
   Booting using the fdt blob at 0x88680708
   Uncompressing Kernel Image
   Loading Device Tree to 8ff48000, end 8ff4cc8e ... OK
[    0.000000] Device Id: 0x05f69053, Device Ver: 0x0001
[    0.000000] OF: reserved mem: Reserved memory: No reserved-memory node in the DT
[    0.000000] Primary instruction cache 32kB, VIPT, 4-way, linesize 16 bytes.
[    0.000000] Primary data cache 32kB, 4-way, VIPT, cache aliases, linesize 16 bytes
[    0.000000] Zone ranges:
[    0.000000]   Normal   [mem 0x0000000008000000-0x000000000fffffff]
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000008000000-0x000000000fffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000008000000-0x000000000fffffff]
[    0.000000] Kernel command line: earlyprintk=ttyPIC1,115200n8r console=ttyPIC1,115200n8  console=ttyPIC1,115200 rw root=/dev/nfs ip=dhcp
[    0.000000] Unknown kernel command line parameters "earlyprintk=ttyPIC1,115200n8r", will be passed to user space.
[    0.000000] printk: log buffer data + meta data: 131072 + 409600 = 540672 bytes
[    0.000000] Dentry cache hash table entries: 16384 (order: 4, 65536 bytes, linear)
[    0.000000] Inode-cache hash table entries: 8192 (order: 3, 32768 bytes, linear)
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 32768
[    0.000000] mem auto-init: stack:all(zero), heap alloc:off, heap free:off
[    0.000000] SLUB: HWalign=32, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
[    0.000000] NR_IRQS: 256
[    0.000000] CPU Clock: 200MHz
[    0.000000] clocksource: MIPS: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604467 ns
[    0.000010] sched_clock: 32 bits at 100MHz, resolution 10ns, wraps every 21474836475ns
[    0.007942] Calibrating delay loop... 199.68 BogoMIPS (lpj=399360)
[    0.045103] pid_max: default: 32768 minimum: 301
[    0.050804] Mount-cache hash table entries: 1024 (order: 0, 4096 bytes, linear)
[    0.057499] Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes, linear)
[    0.067409] VFS: Finished mounting rootfs on nullfs
[    0.085520] Memory: 123656K/131072K available (3662K kernel code, 554K rwdata, 496K rodata, 208K init, 186K bss, 6332K reserved, 0K cma-reserved)
[    0.102653] devtmpfs: initialized
[    0.117981] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
[    0.127284] posixtimers hash table entries: 512 (order: 0, 2048 bytes, linear)
[    0.134080] futex hash table entries: 256 (4096 bytes on 1 NUMA nodes, total 4 KiB, linear).
[    0.146965] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.156118] pic32-clk: dt requests SOSC.
[    0.191734] gpio gpiochip0: Static allocation of GPIO base is deprecated, use dynamic allocation.
[    0.201812] gpio gpiochip1: Static allocation of GPIO base is deprecated, use dynamic allocation.
[    0.211810] gpio gpiochip2: Static allocation of GPIO base is deprecated, use dynamic allocation.
[    0.221937] gpio gpiochip3: Static allocation of GPIO base is deprecated, use dynamic allocation.
[    0.231892] gpio gpiochip4: Static allocation of GPIO base is deprecated, use dynamic allocation.
[    0.241943] gpio gpiochip5: Static allocation of GPIO base is deprecated, use dynamic allocation.
[    0.251923] gpio gpiochip6: Static allocation of GPIO base is deprecated, use dynamic allocation.
[    0.262029] gpio gpiochip7: Static allocation of GPIO base is deprecated, use dynamic allocation.
[    0.272063] gpio gpiochip8: Static allocation of GPIO base is deprecated, use dynamic allocation.
[    0.282110] gpio gpiochip9: Static allocation of GPIO base is deprecated, use dynamic allocation.
[    0.295550] 1f822200.serial: ttyPIC1 at MMIO 0x1f822200 (irq = 0, base_baud = 2500000) is a pic32-uart
[    0.304707] printk: legacy console [ttyPIC1] enabled
[    0.304707] printk: legacy console [ttyPIC1] enabled
[    0.314277] printk: legacy bootconsole [early0] disabled
[    0.472677] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    0.483342] RPC: Registered named UNIX socket transport module.
[    0.489820] RPC: Registered udp transport module.
[    0.494753] RPC: Registered tcp transport module.
[    0.499719] RPC: Registered tcp-with-tls transport module.
[    0.505570] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    0.516264] workingset: timestamp_bits=30 max_order=15 bucket_order=0
[    0.538271] NET: Registered PF_PACKET protocol family
[   12.875811] clk: Disabling unused clocks
[   12.882043] Root-NFS: no NFS server address
[   12.886683] VFS: Unable to mount root fs via NFS.
[   12.892208] devtmpfs: mounted
[   12.895385] VFS: Failed to pivot into new rootfs
[   12.906115] Freeing unused kernel image (initmem) memory: 208K
[   12.912383] This architecture does not have kernel memory protection.
[   12.919176] Run /sbin/init as init process
[   12.923952] Run /etc/init as init process
[   12.928796] Run /bin/init as init process
[   12.933613] Run /bin/sh as init process
[   12.938264] Kernel panic - not syncing: No working init found.  Try passing init= option to kernel. See Linux Documentation/admin-guide/init.rst for guidance.
[   12.952914] ---[ end Kernel panic - not syncing: No working init found.  Try passing init= option to kernel. See Linux Documentation/admin-guide/init.rst for guidance. ]---



--+d3DKV7c4yq6zleZ
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment; filename="wrt54gs.txt"

Linux version 6.18.20 (wbx@fluor) (mipsel-freewrt-linux-uclibc-gcc (GCC) 15.2.0, GNU ld (GNU Binutils) 2.46.0.20260210) #1 Fri Mar 27 21:04:53 CET 2026
printk: legacy bootconsole [early0] enabled
CPU0 revision is: 00029007 (Broadcom BMIPS3300)
bcm47xx: Using ssb bus
ssb: Found chip with id 0x4712, rev 0x01 and package 0x00
can not parse nvram name (null)ag0(null) with value 255 got -34
ssb: Sonics Silicon Backplane found at address 0x18000000
Primary instruction cache 8kB, VIPT, 2-way, linesize 16 bytes.
Primary data cache 4kB, 2-way, VIPT, no aliases, linesize 16 bytes
Zone ranges:
  Normal   [mem 0x0000000000000000-0x0000000001ffffff]
Movable zone start for each node
Early memory node ranges
  node   0: [mem 0x0000000000000000-0x0000000001ffffff]
Initmem setup node 0 [mem 0x0000000000000000-0x0000000001ffffff]
pcpu-alloc: s0 r0 d32768 u32768 alloc=1*32768
pcpu-alloc: [0] 0 
Kernel command line: root=/dev/mtdblock4 rootfstype=squashfs init=/etc/preinit noinitrd console=ttyS0,115200
Unknown kernel command line parameters "noinitrd", will be passed to user space.
printk: log buffer data + meta data: 131072 + 409600 = 540672 bytes
Dentry cache hash table entries: 4096 (order: 2, 16384 bytes, linear)
Inode-cache hash table entries: 2048 (order: 1, 8192 bytes, linear)
Built 1 zonelists, mobility grouping on.  Total pages: 8192
mem auto-init: stack:all(zero), heap alloc:off, heap free:off
SLUB: HWalign=32, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
NR_IRQS: 256
MIPS: machine is Linksys WRT54G/GS/GL
clocksource: MIPS: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604467 ns
sched_clock: 32 bits at 100MHz, resolution 10ns, wraps every 21474836475ns
Console: colour dummy device 80x25
Calibrating delay loop... 198.65 BogoMIPS (lpj=397312)
pid_max: default: 32768 minimum: 301
Mount-cache hash table entries: 1024 (order: 0, 4096 bytes, linear)
Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes, linear)
Memory: 26188K/32768K available (3945K kernel code, 569K rwdata, 948K rodata, 160K init, 267K bss, 6220K reserved, 0K cma-reserved)
devtmpfs: initialized
clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
posixtimers hash table entries: 512 (order: 0, 2048 bytes, linear)
futex hash table entries: 256 (4096 bytes on 1 NUMA nodes, total 4 KiB, linear).
NET: Registered PF_NETLINK/PF_ROUTE protocol family
clocksource: Switched to clocksource MIPS
PCI host bridge to bus 0000:00
pci_bus 0000:00: root bus resource [mem 0x40000000-0x7fffffff]
pci_bus 0000:00: root bus resource [io  0x0100-0x07ff]
pci_bus 0000:00: No busn resource found for root bus, will use [bus 00-ff]
pci 0000:00:00.0: PCI: Fixing up bridge 0000:00:00.0
pci 0000:00:00.0: PCI: Fixing up device 0000:00:00.0
pci 0000:00:00.0: PCI: Fixing latency timer of device 0000:00:00.0 to 168
pci 0000:00:00.0: ssb_pcicore_fixup_pcibridge+0x0/0xf8 took 17879 usecs
pci 0000:00:00.0: [14e4:4712] type 00 class 0x060000 conventional PCI endpoint
pci 0000:00:00.0: BAR 0 [mem 0x00000000-0x00001fff]
pci 0000:00:00.0: BAR 1 [mem 0x00000000-0x07ffffff pref]
pci 0000:00:01.0: [14e4:4712] type 00 class 0x060000 conventional PCI endpoint
pci 0000:00:01.0: BAR 0 [mem 0x00000000-0x00001fff]
pci 0000:00:01.0: BAR 1 [mem 0x00000000-0x07ffffff pref]
pci 0000:00:02.0: [14e4:4712] type 00 class 0x060000 conventional PCI endpoint
pci 0000:00:02.0: BAR 0 [mem 0x00000000-0x00001fff]
pci 0000:00:02.0: BAR 1 [mem 0x00000000-0x07ffffff pref]
pci 0000:00:03.0: [14e4:4712] type 00 class 0x060000 conventional PCI endpoint
pci 0000:00:03.0: BAR 0 [mem 0x00000000-0x00001fff]
pci 0000:00:03.0: BAR 1 [mem 0x00000000-0x07ffffff pref]
pci 0000:00:04.0: [14e4:4712] type 00 class 0x060000 conventional PCI endpoint
pci 0000:00:04.0: BAR 0 [mem 0x00000000-0x00001fff]
pci 0000:00:04.0: BAR 1 [mem 0x00000000-0x07ffffff pref]
pci 0000:00:05.0: [14e4:4712] type 00 class 0x060000 conventional PCI endpoint
pci 0000:00:05.0: BAR 0 [mem 0x00000000-0x00001fff]
pci 0000:00:05.0: BAR 1 [mem 0x00000000-0x07ffffff pref]
pci 0000:00:06.0: [14e4:4712] type 00 class 0x060000 conventional PCI endpoint
pci 0000:00:06.0: BAR 0 [mem 0x00000000-0x00001fff]
pci 0000:00:06.0: BAR 1 [mem 0x00000000-0x07ffffff pref]
pci 0000:00:07.0: [14e4:4712] type 00 class 0x060000 conventional PCI endpoint
pci 0000:00:07.0: BAR 0 [mem 0x00000000-0x00001fff]
pci 0000:00:07.0: BAR 1 [mem 0x00000000-0x07ffffff pref]
pci 0000:00:08.0: [14e4:4712] type 00 class 0x060000 conventional PCI endpoint
pci 0000:00:08.0: BAR 0 [mem 0x00000000-0x00001fff]
pci 0000:00:08.0: BAR 1 [mem 0x00000000-0x07ffffff pref]
pci 0000:00:09.0: [14e4:4712] type 00 class 0x060000 conventional PCI endpoint
pci 0000:00:09.0: BAR 0 [mem 0x00000000-0x00001fff]
pci 0000:00:09.0: BAR 1 [mem 0x00000000-0x07ffffff pref]
pci 0000:00:0a.0: [14e4:4712] type 00 class 0x060000 conventional PCI endpoint
pci 0000:00:0a.0: BAR 0 [mem 0x00000000-0x00001fff]
pci 0000:00:0a.0: BAR 1 [mem 0x00000000-0x07ffffff pref]
pci 0000:00:0b.0: [14e4:4712] type 00 class 0x060000 conventional PCI endpoint
pci 0000:00:0b.0: BAR 0 [mem 0x00000000-0x00001fff]
pci 0000:00:0b.0: BAR 1 [mem 0x00000000-0x07ffffff pref]
pci 0000:00:0c.0: [14e4:4712] type 00 class 0x060000 conventional PCI endpoint
pci 0000:00:0c.0: BAR 0 [mem 0x00000000-0x00001fff]
pci 0000:00:0c.0: BAR 1 [mem 0x00000000-0x07ffffff pref]
pci 0000:00:0d.0: [14e4:4712] type 00 class 0x060000 conventional PCI endpoint
pci 0000:00:0d.0: BAR 0 [mem 0x00000000-0x00001fff]
pci 0000:00:0d.0: BAR 1 [mem 0x00000000-0x07ffffff pref]
pci 0000:00:0e.0: [14e4:4712] type 00 class 0x060000 conventional PCI endpoint
pci 0000:00:0e.0: BAR 0 [mem 0x00000000-0x00001fff]
pci 0000:00:0e.0: BAR 1 [mem 0x00000000-0x07ffffff pref]
pci 0000:00:0f.0: [14e4:4712] type 00 class 0x060000 conventional PCI endpoint
pci 0000:00:0f.0: BAR 0 [mem 0x00000000-0x00001fff]
pci 0000:00:0f.0: BAR 1 [mem 0x00000000-0x07ffffff pref]
pci_bus 0000:00: busn_res: [bus 00-ff] end is updated to 00
gpio gpiochip0: Static allocation of GPIO base is deprecated, use dynamic allocation.
NET: Registered PF_INET protocol family
IP idents hash table entries: 2048 (order: 2, 16384 bytes, linear)
tcp_listen_portaddr_hash hash table entries: 1024 (order: 0, 4096 bytes, linear)
Table-perturb hash table entries: 65536 (order: 6, 262144 bytes, linear)
TCP established hash table entries: 1024 (order: 0, 4096 bytes, linear)
TCP bind hash table entries: 1024 (order: 1, 8192 bytes, linear)
TCP: Hash tables configured (established 1024 bind 1024)
UDP hash table entries: 256 (order: 1, 8192 bytes, linear)
UDP-Lite hash table entries: 256 (order: 1, 8192 bytes, linear)
NET: Registered PF_UNIX/PF_LOCAL protocol family
PCI: CLS 0 bytes, default 16
Initialise system trusted keyrings
workingset: timestamp_bits=30 max_order=13 bucket_order=0
squashfs: version 4.0 (2009/01/31) Phillip Lougher
Key type asymmetric registered
Asymmetric key parser 'x509' registered
io scheduler mq-deadline registered
Serial: 8250/16550 driver, 2 ports, IRQ sharing disabled
printk: legacy console [ttyS0] disabled
serial8250.0: ttyS0 at MMIO 0xb8000300 (irq = 3, base_baud = 3125000) is a 16550A
printk: legacy console [ttyS0] enabled
printk: legacy bootconsole [early0] disabled
serial8250.0: ttyS1 at MMIO 0xb8000400 (irq = 3, base_baud = 3125000) is a 16550A
physmap-flash physmap-flash.0: physmap platform flash device: [mem 0x1c000000-0x1e000000]
physmap-flash.0: Found 1 x16 devices at 0x0 in 16-bit bank. Manufacturer ID 0x000089 Chip ID 0x000017
physmap-flash.0: Found an alias at 0x800000 for the chip at 0x0
physmap-flash.0: Found an alias at 0x1000000 for the chip at 0x0
physmap-flash.0: Found an alias at 0x1800000 for the chip at 0x0
Intel/Sharp Extended Query Table at 0x0031
Intel/Sharp Extended Query Table at 0x0031
Using buffer write method
cfi_cmdset_0001: Erase suspend on write enabled
erase region 0: offset=0x0,size=0x20000,blocks=64
4 bcm47xxpart partitions found on MTD device physmap-flash.0
Creating 4 MTD partitions on "physmap-flash.0":
0x000000000000-0x000000040000 : "boot"
0x000000040000-0x0000007c0000 : "firmware"
failed to parse "brcm,trx-magic" DT attribute, using default: -89
3 trx partitions found on MTD device firmware
Creating 3 MTD partitions on "firmware":
0x00000000001c-0x00000000091c : "loader"
mtd: partition "loader" doesn't start on an erase/write block boundary -- force read-only
0x00000000091c-0x0000001bb400 : "linux"
mtd: partition "linux" doesn't start on an erase/write block boundary -- force read-only
0x0000001bb400-0x000000780000 : "rootfs"
mtd: partition "rootfs" doesn't start on an erase/write block boundary -- force read-only
0x0000007c0000-0x0000007e0000 : "fwcf"
0x0000007e0000-0x000000800000 : "nvram"
b44 ssb0:1: could not find PHY at 30, use fixed one
b44: WBX: skip phy completely
b44 ssb0:1 eth0: Broadcom 44xx/47xx 10/100 PCI ethernet driver 00:0f:66:c8:74:47
NET: Registered PF_PACKET protocol family
8021q: 802.1Q VLAN Support v1.8
Loading compiled-in X.509 certificates
input: gpio-keys as /devices/platform/gpio-keys.0/input/input0
check access for rdinit=/init failed: -2, ignoring
VFS: Mounted root (squashfs filesystem) readonly on device 31:4.
devtmpfs: mounted
Freeing unused kernel image (initmem) memory: 160K
This architecture does not have kernel memory protection.
Run /etc/preinit as init process
  with arguments:
    /etc/preinit
    noinitrd
  with environment:
    HOME=/
    TERM=linux
random: crng init done
cfg80211: Loading compiled-in X.509 certificates for regulatory database
Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
Loaded X.509 cert 'wens: 61c038651aabdcf94bd0ac7ff06c7248db18c600'
faux_driver regulatory: Direct firmware load for regulatory.db failed with error -2
cfg80211: failed to load regulatory.db
adm6996: adm6996_gpio: ADM6996L model PHY found.
b43-phy0: Broadcom 4712 WLAN found (core revision 7)
b43-phy0: Found PHY: Analog 2, Type 2 (G), Revision 2
b43-phy0: Found Radio: Manuf 0x17F, ID 0x2050, Revision 2, Version 0
Broadcom 43xx driver loaded [ Features: PL ]
ieee80211 phy0: Selected rate control algorithm 'minstrel_ht'
Linux freewrt 6.18.20 #1 Fri Mar 27 21:04:53 CET 2026 mips GNU/Linux
system type		: Broadcom BCM4712
machine			: Linksys WRT54G/GS/GL
processor		: 0
cpu model		: Broadcom BMIPS3300 V0.7
BogoMIPS		: 198.65
wait instruction	: yes
microsecond timers	: yes
tlb_entries		: 32
extra interrupt vector	: yes
hardware watchpoint	: no
isa			: mips1 mips2 mips32r1
ASEs implemented	:
Options implemented	: tlb 4kex 4k_cache prefetch mcheck ejtag llsc
shadow register sets	: 1
kscratch registers	: 0
package			: 0
core			: 0
VCED exceptions		: not available
VCEI exceptions		: not available


--+d3DKV7c4yq6zleZ--

