Return-Path: <linux-mips+bounces-15098-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SsGwDfp8MGrKTgUAu9opvQ
	(envelope-from <linux-mips+bounces-15098-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 16 Jun 2026 00:30:18 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FB868A5E1
	for <lists+linux-mips@lfdr.de>; Tue, 16 Jun 2026 00:30:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=UlwdKeLg;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15098-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-mips+bounces-15098-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1B01B307E98A
	for <lists+linux-mips@lfdr.de>; Mon, 15 Jun 2026 22:29:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EDB23B71CD;
	Mon, 15 Jun 2026 22:29:47 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9A23B8413;
	Mon, 15 Jun 2026 22:29:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781562586; cv=none; b=clzIQQdafNwWYgFVNFZbN18JAALWujf0B3USpPKaJdUh8W88DbByl5/JEqxxdXz3OXkFCcGbBCldkAcJBl3ZLZK7VFCKz39LvG8YRX0X6o9NBJmFKDZOPPAqEqZvFb9PDVcPhqZT0RjEcGjyzMVQs6bpYVHDZaWC9jyfIRlrOlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781562586; c=relaxed/simple;
	bh=XdeBU+C1kLyTCP62Z/i5bqB7OYH1jHwE9xSEXi25aF0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XkGyY7hAjrlqv9zldwHJpnELu8xS1jhjx8NrLHLXzlgHjhnW34V55QVus+MVrKHDAvTmRQ7Xtwp8KPwKUQEbpiIkNKxItmFinAWc3TpTYKB+fzMjEraZ6qPfDrOgw0ElfqLieWTxjekjuzbVjQMeRCAgKzggtsaDQG5PWvLj3MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UlwdKeLg; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C04C1F00A3D;
	Mon, 15 Jun 2026 22:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781562581;
	bh=O/bl1G7GDLAJiTcXNGMWwwflXIOD8zgU3eCTBs1RDJ4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=UlwdKeLgKetGOrzVLHAZGvd6Tsa2PjGy/7pZVqzcTnK6E44hFAM7b2vqUDharheYN
	 +CGZ/xW9DUd4peXZdnCmtJOq7EwCCWe/cxEdpBA2yEY15Jzz6r7AdIZv6ScpvCru1D
	 45f1PdMvujzCannGTmdTl0Gb0Dtm7+V3uaeA7RozM81Z8D1NPJoMDdOr2xwlrYxnE/
	 41gt7XR/g0KtrBggxv7TrAD0a1bGglIZSWd5AvG57uAf7nvgJ8ukZJ0SJYq+JTEx9f
	 JEqdG2JiWBrLIbjGFNGkBmNcXXkcNgf10KPtCf9pzHkeLri6uxEIgx1m+ft4neBUMS
	 FeV7SIHWDU8Mg==
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net
Cc: netdev@vger.kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	geert@linux-m68k.org,
	chleroy@kernel.org,
	npiggin@gmail.com,
	mpe@ellerman.id.au,
	maddy@linux.ibm.com,
	linux-mips@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linuxppc-dev@lists.ozlabs.org,
	Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH net-next 2/2] appletalk: move the protocol out of tree
Date: Mon, 15 Jun 2026 15:29:35 -0700
Message-ID: <20260615222935.947233-3-kuba@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260615222935.947233-1-kuba@kernel.org>
References: <20260615222935.947233-1-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15098-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:davem@davemloft.net,m:netdev@vger.kernel.org,m:edumazet@google.com,m:pabeni@redhat.com,m:andrew+netdev@lunn.ch,m:horms@kernel.org,m:geert@linux-m68k.org,m:chleroy@kernel.org,m:npiggin@gmail.com,m:mpe@ellerman.id.au,m:maddy@linux.ibm.com,m:linux-mips@vger.kernel.org,m:linux-m68k@lists.linux-m68k.org,m:linuxppc-dev@lists.ozlabs.org,m:kuba@kernel.org,m:andrew@lunn.ch,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[kuba@kernel.org,linux-mips@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,google.com,redhat.com,lunn.ch,kernel.org,linux-m68k.org,gmail.com,ellerman.id.au,linux.ibm.com,lists.linux-m68k.org,lists.ozlabs.org];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,netdev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ukuu.org.uk:email,vger.kernel.org:from_smtp,tldp.org:url,conectiva.com.br:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linux.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 29FB868A5E1

AppleTalk has been removed in MacOS X 10.6 (Snow Leopard), in 2009,
according to Wikipedia. We recently got a burst of AI generated
fixes to this protocol which nobody is reviewing.

Let AppleTalk follow AX.25 and hamradio out of the Linux tree.
We we will maintain the code at: github.com/linux-netdev/mod-orphan
for anyone interested in playing with it.

Retain the uAPI for now. No strong reason, simply because I suspect
keeping it will be less controversial.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
 MAINTAINERS                                 |    5 +-
 Documentation/admin-guide/sysctl/net.rst    |   46 +-
 net/Kconfig                                 |    1 -
 net/appletalk/Kconfig                       |   30 -
 net/802/Makefile                            |    1 -
 net/Makefile                                |    1 -
 net/appletalk/Makefile                      |   10 -
 include/linux/atalk.h                       |  182 --
 net/appletalk/aarp.c                        | 1041 ----------
 net/appletalk/atalk_proc.c                  |  242 ---
 net/appletalk/ddp.c                         | 2055 -------------------
 net/appletalk/sysctl_net_atalk.c            |   58 -
 arch/arm/configs/ixp4xx_defconfig           |    1 -
 arch/m68k/configs/amiga_defconfig           |    1 -
 arch/m68k/configs/apollo_defconfig          |    1 -
 arch/m68k/configs/atari_defconfig           |    1 -
 arch/m68k/configs/bvme6000_defconfig        |    1 -
 arch/m68k/configs/hp300_defconfig           |    1 -
 arch/m68k/configs/mac_defconfig             |    1 -
 arch/m68k/configs/multi_defconfig           |    1 -
 arch/m68k/configs/mvme147_defconfig         |    1 -
 arch/m68k/configs/mvme16x_defconfig         |    1 -
 arch/m68k/configs/q40_defconfig             |    1 -
 arch/m68k/configs/sun3_defconfig            |    1 -
 arch/m68k/configs/sun3x_defconfig           |    1 -
 arch/mips/configs/gpr_defconfig             |    1 -
 arch/mips/configs/malta_defconfig           |    1 -
 arch/mips/configs/malta_kvm_defconfig       |    1 -
 arch/mips/configs/malta_qemu_32r6_defconfig |    1 -
 arch/mips/configs/maltaaprp_defconfig       |    1 -
 arch/mips/configs/maltasmvp_defconfig       |    1 -
 arch/mips/configs/maltasmvp_eva_defconfig   |    1 -
 arch/mips/configs/maltaup_defconfig         |    1 -
 arch/mips/configs/maltaup_xpa_defconfig     |    1 -
 arch/mips/configs/mtx1_defconfig            |    1 -
 arch/powerpc/configs/ppc6xx_defconfig       |    1 -
 arch/sh/configs/landisk_defconfig           |    1 -
 37 files changed, 3 insertions(+), 3694 deletions(-)
 delete mode 100644 net/appletalk/Kconfig
 delete mode 100644 net/appletalk/Makefile
 delete mode 100644 include/linux/atalk.h
 delete mode 100644 net/appletalk/aarp.c
 delete mode 100644 net/appletalk/atalk_proc.c
 delete mode 100644 net/appletalk/ddp.c
 delete mode 100644 net/appletalk/sysctl_net_atalk.c

diff --git a/MAINTAINERS b/MAINTAINERS
index cc1dde0c9067..06df1171f4cf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1968,10 +1968,9 @@ F:	drivers/hwmon/applesmc.c
 
 APPLETALK NETWORK LAYER
 L:	netdev@vger.kernel.org
-S:	Odd fixes
-F:	include/linux/atalk.h
+S:	Obsolete
 F:	include/uapi/linux/atalk.h
-F:	net/appletalk/
+F:	include/uapi/linux/if_ltalk.h
 
 APPLIED MICRO (APM) X-GENE DEVICE TREE SUPPORT
 M:	Khuong Dinh <khuong@os.amperecomputing.com>
diff --git a/Documentation/admin-guide/sysctl/net.rst b/Documentation/admin-guide/sysctl/net.rst
index 0724a793798f..37c5a0624c5d 100644
--- a/Documentation/admin-guide/sysctl/net.rst
+++ b/Documentation/admin-guide/sysctl/net.rst
@@ -475,51 +475,7 @@ Please see: Documentation/networking/ip-sysctl.rst and
 Documentation/admin-guide/sysctl/net.rst for descriptions of these entries.
 
 
-4. Appletalk
-------------
-
-The /proc/sys/net/appletalk  directory  holds the Appletalk configuration data
-when Appletalk is loaded. The configurable parameters are:
-
-aarp-expiry-time
-----------------
-
-The amount  of  time  we keep an ARP entry before expiring it. Used to age out
-old hosts.
-
-aarp-resolve-time
------------------
-
-The amount of time we will spend trying to resolve an Appletalk address.
-
-aarp-retransmit-limit
----------------------
-
-The number of times we will retransmit a query before giving up.
-
-aarp-tick-time
---------------
-
-Controls the rate at which expires are checked.
-
-The directory  /proc/net/appletalk  holds the list of active Appletalk sockets
-on a machine.
-
-The fields  indicate  the DDP type, the local address (in network:node format)
-the remote  address,  the  size of the transmit pending queue, the size of the
-received queue  (bytes waiting for applications to read) the state and the uid
-owning the socket.
-
-/proc/net/atalk_iface lists  all  the  interfaces  configured for appletalk.It
-shows the  name  of the interface, its Appletalk address, the network range on
-that address  (or  network number for phase 1 networks), and the status of the
-interface.
-
-/proc/net/atalk_route lists  each  known  network  route.  It lists the target
-(network) that the route leads to, the router (may be directly connected), the
-route flags, and the device the route is using.
-
-5. TIPC
+4. TIPC
 -------
 
 tipc_rmem
diff --git a/net/Kconfig b/net/Kconfig
index bdea8aef7983..e38477393551 100644
--- a/net/Kconfig
+++ b/net/Kconfig
@@ -261,7 +261,6 @@ source "net/bridge/Kconfig"
 source "net/dsa/Kconfig"
 source "net/8021q/Kconfig"
 source "net/llc/Kconfig"
-source "net/appletalk/Kconfig"
 source "net/x25/Kconfig"
 source "net/lapb/Kconfig"
 source "net/phonet/Kconfig"
diff --git a/net/appletalk/Kconfig b/net/appletalk/Kconfig
deleted file mode 100644
index 041141abf925..000000000000
--- a/net/appletalk/Kconfig
+++ /dev/null
@@ -1,30 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only
-#
-# Appletalk configuration
-#
-config ATALK
-	tristate "Appletalk protocol support"
-	select LLC
-	help
-	  AppleTalk is the protocol that Apple computers can use to communicate
-	  on a network.  If your Linux box is connected to such a network and you
-	  wish to connect to it, say Y.  You will need to use the netatalk package
-	  so that your Linux box can act as a print and file server for Macs as
-	  well as access AppleTalk printers.  Check out
-	  <http://www.zettabyte.net/netatalk/> on the WWW for details.
-	  EtherTalk is the name used for AppleTalk over Ethernet and the
-	  cheaper and slower LocalTalk is AppleTalk over a proprietary Apple
-	  network using serial links.  EtherTalk and LocalTalk are fully
-	  supported by Linux.
-
-	  General information about how to connect Linux, Windows machines and
-	  Macs is on the WWW at <http://www.eats.com/linux_mac_win.html>.  The
-	  NET3-4-HOWTO, available from
-	  <http://www.tldp.org/docs.html#howto>, contains valuable
-	  information as well.
-
-	  To compile this driver as a module, choose M here: the module will be
-	  called appletalk. You almost certainly want to compile it as a
-	  module so you can restart your AppleTalk stack without rebooting
-	  your machine. I hear that the GNU boycott of Apple is over, so
-	  even politically correct people are allowed to say Y here.
diff --git a/net/802/Makefile b/net/802/Makefile
index 9503ef6b2e06..54784f3cae5a 100644
--- a/net/802/Makefile
+++ b/net/802/Makefile
@@ -6,7 +6,6 @@
 obj-$(CONFIG_LLC)	+= psnap.o
 obj-$(CONFIG_NET_FC)	+=                 fc.o
 obj-$(CONFIG_FDDI)	+=                 fddi.o
-obj-$(CONFIG_ATALK)	+= psnap.o
 obj-$(CONFIG_STP)	+= stp.o
 obj-$(CONFIG_GARP)	+= garp.o
 obj-$(CONFIG_MRP)	+= mrp.o
diff --git a/net/Makefile b/net/Makefile
index d2175fce0406..5b2dd7f07a85 100644
--- a/net/Makefile
+++ b/net/Makefile
@@ -25,7 +25,6 @@ obj-$(CONFIG_NET_KEY)		+= key/
 obj-$(CONFIG_BRIDGE)		+= bridge/
 obj-$(CONFIG_NET_DEVLINK)	+= devlink/
 obj-y				+= dsa/
-obj-$(CONFIG_ATALK)		+= appletalk/
 obj-$(CONFIG_X25)		+= x25/
 obj-$(CONFIG_LAPB)		+= lapb/
 obj-$(CONFIG_CAN)		+= can/
diff --git a/net/appletalk/Makefile b/net/appletalk/Makefile
deleted file mode 100644
index 152312a15180..000000000000
--- a/net/appletalk/Makefile
+++ /dev/null
@@ -1,10 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only
-#
-# Makefile for the Linux AppleTalk layer.
-#
-
-obj-$(CONFIG_ATALK) += appletalk.o
-
-appletalk-y			:= aarp.o ddp.o
-appletalk-$(CONFIG_PROC_FS)	+= atalk_proc.o
-appletalk-$(CONFIG_SYSCTL)	+= sysctl_net_atalk.o
diff --git a/include/linux/atalk.h b/include/linux/atalk.h
deleted file mode 100644
index ce7e6bfa9e2a..000000000000
--- a/include/linux/atalk.h
+++ /dev/null
@@ -1,182 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __LINUX_ATALK_H__
-#define __LINUX_ATALK_H__
-
-
-#include <net/sock.h>
-#include <uapi/linux/atalk.h>
-
-struct atalk_route {
-	struct net_device  *dev;
-	struct atalk_addr  target;
-	struct atalk_addr  gateway;
-	int		   flags;
-	struct atalk_route *next;
-};
-
-/**
- *	struct atalk_iface - AppleTalk Interface
- *	@dev - Network device associated with this interface
- *	@address - Our address
- *	@status - What are we doing?
- *	@nets - Associated direct netrange
- *	@next - next element in the list of interfaces
- */
-struct atalk_iface {
-	struct net_device	*dev;
-	struct atalk_addr	address;
-	int			status;
-#define ATIF_PROBE	1		/* Probing for an address */
-#define ATIF_PROBE_FAIL	2		/* Probe collided */
-	struct atalk_netrange	nets;
-	struct atalk_iface	*next;
-	struct hlist_node	hash_node;	/* keyed on dev->ifindex */
-};
-	
-struct atalk_sock {
-	/* struct sock has to be the first member of atalk_sock */
-	struct sock	sk;
-	__be16		dest_net;
-	__be16		src_net;
-	unsigned char	dest_node;
-	unsigned char	src_node;
-	unsigned char	dest_port;
-	unsigned char	src_port;
-};
-
-static inline struct atalk_sock *at_sk(struct sock *sk)
-{
-	return (struct atalk_sock *)sk;
-}
-
-struct ddpehdr {
-	__be16	deh_len_hops;	/* lower 10 bits are length, next 4 - hops */
-	__be16	deh_sum;
-	__be16	deh_dnet;
-	__be16	deh_snet;
-	__u8	deh_dnode;
-	__u8	deh_snode;
-	__u8	deh_dport;
-	__u8	deh_sport;
-	/* And netatalk apps expect to stick the type in themselves */
-};
-
-static __inline__ struct ddpehdr *ddp_hdr(struct sk_buff *skb)
-{
-	return (struct ddpehdr *)skb_transport_header(skb);
-}
-
-/* AppleTalk AARP headers */
-struct elapaarp {
-	__be16	hw_type;
-#define AARP_HW_TYPE_ETHERNET		1
-#define AARP_HW_TYPE_TOKENRING		2
-	__be16	pa_type;
-	__u8	hw_len;
-	__u8	pa_len;
-#define AARP_PA_ALEN			4
-	__be16	function;
-#define AARP_REQUEST			1
-#define AARP_REPLY			2
-#define AARP_PROBE			3
-	__u8	hw_src[ETH_ALEN];
-	__u8	pa_src_zero;
-	__be16	pa_src_net;
-	__u8	pa_src_node;
-	__u8	hw_dst[ETH_ALEN];
-	__u8	pa_dst_zero;
-	__be16	pa_dst_net;
-	__u8	pa_dst_node;
-} __attribute__ ((packed));
-
-static __inline__ struct elapaarp *aarp_hdr(struct sk_buff *skb)
-{
-	return (struct elapaarp *)skb_transport_header(skb);
-}
-
-/* Not specified - how long till we drop a resolved entry */
-#define AARP_EXPIRY_TIME	(5 * 60 * HZ)
-/* Size of hash table */
-#define AARP_HASH_SIZE		16
-/* Fast retransmission timer when resolving */
-#define AARP_TICK_TIME		(HZ / 5)
-/* Send 10 requests then give up (2 seconds) */
-#define AARP_RETRANSMIT_LIMIT	10
-/*
- * Some value bigger than total retransmit time + a bit for last reply to
- * appear and to stop continual requests
- */
-#define AARP_RESOLVE_TIME	(10 * HZ)
-
-extern struct datalink_proto *ddp_dl, *aarp_dl;
-extern int aarp_proto_init(void);
-
-/* Inter module exports */
-
-/* Give a device find its atif control structure */
-extern struct atalk_iface *atalk_find_dev(struct net_device *dev);
-
-extern struct atalk_addr *atalk_find_dev_addr(struct net_device *dev);
-extern struct net_device *atrtr_get_dev(struct atalk_addr *sa);
-extern int		 aarp_send_ddp(struct net_device *dev,
-				       struct sk_buff *skb,
-				       struct atalk_addr *sa, void *hwaddr);
-extern void		 aarp_device_down(struct net_device *dev);
-extern void		 aarp_probe_network(struct atalk_iface *atif);
-extern int 		 aarp_proxy_probe_network(struct atalk_iface *atif,
-				     struct atalk_addr *sa);
-extern void		 aarp_proxy_remove(struct net_device *dev,
-					   struct atalk_addr *sa);
-
-extern void		aarp_cleanup_module(void);
-
-extern struct hlist_head atalk_sockets;
-extern rwlock_t atalk_sockets_lock;
-
-extern struct atalk_route *atalk_routes;
-extern rwlock_t atalk_routes_lock;
-
-extern struct atalk_iface *atalk_interfaces;
-extern rwlock_t atalk_interfaces_lock;
-
-extern struct atalk_route atrtr_default;
-
-struct aarp_iter_state {
-	int bucket;
-	struct aarp_entry **table;
-};
-
-extern const struct seq_operations aarp_seq_ops;
-
-extern int sysctl_aarp_expiry_time;
-extern int sysctl_aarp_tick_time;
-extern int sysctl_aarp_retransmit_limit;
-extern int sysctl_aarp_resolve_time;
-
-#ifdef CONFIG_SYSCTL
-extern int atalk_register_sysctl(void);
-extern void atalk_unregister_sysctl(void);
-#else
-static inline int atalk_register_sysctl(void)
-{
-	return 0;
-}
-static inline void atalk_unregister_sysctl(void)
-{
-}
-#endif
-
-#ifdef CONFIG_PROC_FS
-extern int atalk_proc_init(void);
-extern void atalk_proc_exit(void);
-#else
-static inline int atalk_proc_init(void)
-{
-	return 0;
-}
-static inline void atalk_proc_exit(void)
-{
-}
-#endif /* CONFIG_PROC_FS */
-
-#endif /* __LINUX_ATALK_H__ */
diff --git a/net/appletalk/aarp.c b/net/appletalk/aarp.c
deleted file mode 100644
index 078fb7a6efa5..000000000000
--- a/net/appletalk/aarp.c
+++ /dev/null
@@ -1,1041 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- *	AARP:		An implementation of the AppleTalk AARP protocol for
- *			Ethernet 'ELAP'.
- *
- *		Alan Cox  <Alan.Cox@linux.org>
- *
- *	This doesn't fit cleanly with the IP arp. Potentially we can use
- *	the generic neighbour discovery code to clean this up.
- *
- *	FIXME:
- *		We ought to handle the retransmits with a single list and a
- *	separate fast timer for when it is needed.
- *		Use neighbour discovery code.
- *		Token Ring Support.
- *
- *	References:
- *		Inside AppleTalk (2nd Ed).
- *	Fixes:
- *		Jaume Grau	-	flush caches on AARP_PROBE
- *		Rob Newberry	-	Added proxy AARP and AARP proc fs,
- *					moved probing from DDP module.
- *		Arnaldo C. Melo -	don't mangle rx packets
- */
-
-#include <linux/if_arp.h>
-#include <linux/slab.h>
-#include <net/sock.h>
-#include <net/datalink.h>
-#include <net/psnap.h>
-#include <linux/atalk.h>
-#include <linux/delay.h>
-#include <linux/init.h>
-#include <linux/proc_fs.h>
-#include <linux/seq_file.h>
-#include <linux/export.h>
-#include <linux/etherdevice.h>
-#include <linux/refcount.h>
-
-int sysctl_aarp_expiry_time = AARP_EXPIRY_TIME;
-int sysctl_aarp_tick_time = AARP_TICK_TIME;
-int sysctl_aarp_retransmit_limit = AARP_RETRANSMIT_LIMIT;
-int sysctl_aarp_resolve_time = AARP_RESOLVE_TIME;
-
-/* Lists of aarp entries */
-/**
- *	struct aarp_entry - AARP entry
- *	@refcnt: Reference count
- *	@last_sent: Last time we xmitted the aarp request
- *	@packet_queue: Queue of frames wait for resolution
- *	@status: Used for proxy AARP
- *	@expires_at: Entry expiry time
- *	@target_addr: DDP Address
- *	@dev:  Device to use
- *	@hwaddr:  Physical i/f address of target/router
- *	@xmit_count:  When this hits 10 we give up
- *	@next: Next entry in chain
- */
-struct aarp_entry {
-	refcount_t			refcnt;
-	/* These first two are only used for unresolved entries */
-	unsigned long		last_sent;
-	struct sk_buff_head	packet_queue;
-	int			status;
-	unsigned long		expires_at;
-	struct atalk_addr	target_addr;
-	struct net_device	*dev;
-	char			hwaddr[ETH_ALEN];
-	unsigned short		xmit_count;
-	struct aarp_entry	*next;
-};
-
-/* Hashed list of resolved, unresolved and proxy entries */
-static struct aarp_entry *resolved[AARP_HASH_SIZE];
-static struct aarp_entry *unresolved[AARP_HASH_SIZE];
-static struct aarp_entry *proxies[AARP_HASH_SIZE];
-static int unresolved_count;
-
-/* One lock protects it all. */
-static DEFINE_RWLOCK(aarp_lock);
-
-/* Used to walk the list and purge/kick entries.  */
-static struct timer_list aarp_timer;
-
-static inline void aarp_entry_get(struct aarp_entry *a)
-{
-	refcount_inc(&a->refcnt);
-}
-
-static inline void aarp_entry_put(struct aarp_entry *a)
-{
-	if (refcount_dec_and_test(&a->refcnt))
-		kfree(a);
-}
-
-/*
- *	Delete an aarp queue
- *
- *	Must run under aarp_lock.
- */
-static void __aarp_expire(struct aarp_entry *a)
-{
-	skb_queue_purge(&a->packet_queue);
-	aarp_entry_put(a);
-}
-
-/*
- *	Send an aarp queue entry request
- *
- *	Must run under aarp_lock.
- */
-static void __aarp_send_query(struct aarp_entry *a)
-{
-	static unsigned char aarp_eth_multicast[ETH_ALEN] =
-					{ 0x09, 0x00, 0x07, 0xFF, 0xFF, 0xFF };
-	struct net_device *dev = a->dev;
-	struct elapaarp *eah;
-	int len = dev->hard_header_len + sizeof(*eah) + aarp_dl->header_length;
-	struct sk_buff *skb = alloc_skb(len, GFP_ATOMIC);
-	struct atalk_addr *sat = atalk_find_dev_addr(dev);
-
-	if (!skb)
-		return;
-
-	if (!sat) {
-		kfree_skb(skb);
-		return;
-	}
-
-	/* Set up the buffer */
-	skb_reserve(skb, dev->hard_header_len + aarp_dl->header_length);
-	skb_reset_network_header(skb);
-	skb_reset_transport_header(skb);
-	skb_put(skb, sizeof(*eah));
-	skb->protocol    = htons(ETH_P_ATALK);
-	skb->dev	 = dev;
-	eah		 = aarp_hdr(skb);
-
-	/* Set up the ARP */
-	eah->hw_type	 = htons(AARP_HW_TYPE_ETHERNET);
-	eah->pa_type	 = htons(ETH_P_ATALK);
-	eah->hw_len	 = ETH_ALEN;
-	eah->pa_len	 = AARP_PA_ALEN;
-	eah->function	 = htons(AARP_REQUEST);
-
-	ether_addr_copy(eah->hw_src, dev->dev_addr);
-
-	eah->pa_src_zero = 0;
-	eah->pa_src_net	 = sat->s_net;
-	eah->pa_src_node = sat->s_node;
-
-	eth_zero_addr(eah->hw_dst);
-
-	eah->pa_dst_zero = 0;
-	eah->pa_dst_net	 = a->target_addr.s_net;
-	eah->pa_dst_node = a->target_addr.s_node;
-
-	/* Send it */
-	aarp_dl->request(aarp_dl, skb, aarp_eth_multicast);
-	/* Update the sending count */
-	a->xmit_count++;
-	a->last_sent = jiffies;
-}
-
-/* This runs under aarp_lock and in softint context, so only atomic memory
- * allocations can be used. */
-static void aarp_send_reply(struct net_device *dev, struct atalk_addr *us,
-			    struct atalk_addr *them, unsigned char *sha)
-{
-	struct elapaarp *eah;
-	int len = dev->hard_header_len + sizeof(*eah) + aarp_dl->header_length;
-	struct sk_buff *skb = alloc_skb(len, GFP_ATOMIC);
-
-	if (!skb)
-		return;
-
-	/* Set up the buffer */
-	skb_reserve(skb, dev->hard_header_len + aarp_dl->header_length);
-	skb_reset_network_header(skb);
-	skb_reset_transport_header(skb);
-	skb_put(skb, sizeof(*eah));
-	skb->protocol    = htons(ETH_P_ATALK);
-	skb->dev	 = dev;
-	eah		 = aarp_hdr(skb);
-
-	/* Set up the ARP */
-	eah->hw_type	 = htons(AARP_HW_TYPE_ETHERNET);
-	eah->pa_type	 = htons(ETH_P_ATALK);
-	eah->hw_len	 = ETH_ALEN;
-	eah->pa_len	 = AARP_PA_ALEN;
-	eah->function	 = htons(AARP_REPLY);
-
-	ether_addr_copy(eah->hw_src, dev->dev_addr);
-
-	eah->pa_src_zero = 0;
-	eah->pa_src_net	 = us->s_net;
-	eah->pa_src_node = us->s_node;
-
-	if (!sha)
-		eth_zero_addr(eah->hw_dst);
-	else
-		ether_addr_copy(eah->hw_dst, sha);
-
-	eah->pa_dst_zero = 0;
-	eah->pa_dst_net	 = them->s_net;
-	eah->pa_dst_node = them->s_node;
-
-	/* Send it */
-	aarp_dl->request(aarp_dl, skb, sha);
-}
-
-/*
- *	Send probe frames. Called from aarp_probe_network and
- *	aarp_proxy_probe_network.
- */
-
-static void aarp_send_probe(struct net_device *dev, struct atalk_addr *us)
-{
-	struct elapaarp *eah;
-	int len = dev->hard_header_len + sizeof(*eah) + aarp_dl->header_length;
-	struct sk_buff *skb = alloc_skb(len, GFP_ATOMIC);
-	static unsigned char aarp_eth_multicast[ETH_ALEN] =
-					{ 0x09, 0x00, 0x07, 0xFF, 0xFF, 0xFF };
-
-	if (!skb)
-		return;
-
-	/* Set up the buffer */
-	skb_reserve(skb, dev->hard_header_len + aarp_dl->header_length);
-	skb_reset_network_header(skb);
-	skb_reset_transport_header(skb);
-	skb_put(skb, sizeof(*eah));
-	skb->protocol    = htons(ETH_P_ATALK);
-	skb->dev	 = dev;
-	eah		 = aarp_hdr(skb);
-
-	/* Set up the ARP */
-	eah->hw_type	 = htons(AARP_HW_TYPE_ETHERNET);
-	eah->pa_type	 = htons(ETH_P_ATALK);
-	eah->hw_len	 = ETH_ALEN;
-	eah->pa_len	 = AARP_PA_ALEN;
-	eah->function	 = htons(AARP_PROBE);
-
-	ether_addr_copy(eah->hw_src, dev->dev_addr);
-
-	eah->pa_src_zero = 0;
-	eah->pa_src_net	 = us->s_net;
-	eah->pa_src_node = us->s_node;
-
-	eth_zero_addr(eah->hw_dst);
-
-	eah->pa_dst_zero = 0;
-	eah->pa_dst_net	 = us->s_net;
-	eah->pa_dst_node = us->s_node;
-
-	/* Send it */
-	aarp_dl->request(aarp_dl, skb, aarp_eth_multicast);
-}
-
-/*
- *	Handle an aarp timer expire
- *
- *	Must run under the aarp_lock.
- */
-
-static void __aarp_expire_timer(struct aarp_entry **n)
-{
-	struct aarp_entry *t;
-
-	while (*n)
-		/* Expired ? */
-		if (time_after(jiffies, (*n)->expires_at)) {
-			t = *n;
-			*n = (*n)->next;
-			__aarp_expire(t);
-		} else
-			n = &((*n)->next);
-}
-
-/*
- *	Kick all pending requests 5 times a second.
- *
- *	Must run under the aarp_lock.
- */
-static void __aarp_kick(struct aarp_entry **n)
-{
-	struct aarp_entry *t;
-
-	while (*n)
-		/* Expired: if this will be the 11th tx, we delete instead. */
-		if ((*n)->xmit_count >= sysctl_aarp_retransmit_limit) {
-			t = *n;
-			*n = (*n)->next;
-			__aarp_expire(t);
-		} else {
-			__aarp_send_query(*n);
-			n = &((*n)->next);
-		}
-}
-
-/*
- *	A device has gone down. Take all entries referring to the device
- *	and remove them.
- *
- *	Must run under the aarp_lock.
- */
-static void __aarp_expire_device(struct aarp_entry **n, struct net_device *dev)
-{
-	struct aarp_entry *t;
-
-	while (*n)
-		if ((*n)->dev == dev) {
-			t = *n;
-			*n = (*n)->next;
-			__aarp_expire(t);
-		} else
-			n = &((*n)->next);
-}
-
-/* Handle the timer event */
-static void aarp_expire_timeout(struct timer_list *unused)
-{
-	int ct;
-
-	write_lock_bh(&aarp_lock);
-
-	for (ct = 0; ct < AARP_HASH_SIZE; ct++) {
-		__aarp_expire_timer(&resolved[ct]);
-		__aarp_kick(&unresolved[ct]);
-		__aarp_expire_timer(&unresolved[ct]);
-		__aarp_expire_timer(&proxies[ct]);
-	}
-
-	write_unlock_bh(&aarp_lock);
-	mod_timer(&aarp_timer, jiffies +
-			       (unresolved_count ? sysctl_aarp_tick_time :
-				sysctl_aarp_expiry_time));
-}
-
-/* Network device notifier chain handler. */
-static int aarp_device_event(struct notifier_block *this, unsigned long event,
-			     void *ptr)
-{
-	struct net_device *dev = netdev_notifier_info_to_dev(ptr);
-	int ct;
-
-	if (!net_eq(dev_net(dev), &init_net))
-		return NOTIFY_DONE;
-
-	if (event == NETDEV_DOWN) {
-		write_lock_bh(&aarp_lock);
-
-		for (ct = 0; ct < AARP_HASH_SIZE; ct++) {
-			__aarp_expire_device(&resolved[ct], dev);
-			__aarp_expire_device(&unresolved[ct], dev);
-			__aarp_expire_device(&proxies[ct], dev);
-		}
-
-		write_unlock_bh(&aarp_lock);
-	}
-	return NOTIFY_DONE;
-}
-
-/* Expire all entries in a hash chain */
-static void __aarp_expire_all(struct aarp_entry **n)
-{
-	struct aarp_entry *t;
-
-	while (*n) {
-		t = *n;
-		*n = (*n)->next;
-		__aarp_expire(t);
-	}
-}
-
-/* Cleanup all hash chains -- module unloading */
-static void aarp_purge(void)
-{
-	int ct;
-
-	write_lock_bh(&aarp_lock);
-	for (ct = 0; ct < AARP_HASH_SIZE; ct++) {
-		__aarp_expire_all(&resolved[ct]);
-		__aarp_expire_all(&unresolved[ct]);
-		__aarp_expire_all(&proxies[ct]);
-	}
-	write_unlock_bh(&aarp_lock);
-}
-
-/*
- *	Create a new aarp entry.  This must use GFP_ATOMIC because it
- *	runs while holding spinlocks.
- */
-static struct aarp_entry *aarp_alloc(void)
-{
-	struct aarp_entry *a = kzalloc_obj(*a, GFP_ATOMIC);
-	if (!a)
-		return NULL;
-
-	refcount_set(&a->refcnt, 1);
-	skb_queue_head_init(&a->packet_queue);
-	return a;
-}
-
-/*
- * Find an entry. We might return an expired but not yet purged entry. We
- * don't care as it will do no harm.
- *
- * This must run under the aarp_lock.
- */
-static struct aarp_entry *__aarp_find_entry(struct aarp_entry *list,
-					    struct net_device *dev,
-					    struct atalk_addr *sat)
-{
-	while (list) {
-		if (list->target_addr.s_net == sat->s_net &&
-		    list->target_addr.s_node == sat->s_node &&
-		    list->dev == dev)
-			break;
-		list = list->next;
-	}
-
-	return list;
-}
-
-/* Called from the DDP code, and thus must be exported. */
-void aarp_proxy_remove(struct net_device *dev, struct atalk_addr *sa)
-{
-	int hash = sa->s_node % (AARP_HASH_SIZE - 1);
-	struct aarp_entry *a;
-
-	write_lock_bh(&aarp_lock);
-
-	a = __aarp_find_entry(proxies[hash], dev, sa);
-	if (a)
-		a->expires_at = jiffies - 1;
-
-	write_unlock_bh(&aarp_lock);
-}
-
-/* This must run under aarp_lock. */
-static struct atalk_addr *__aarp_proxy_find(struct net_device *dev,
-					    struct atalk_addr *sa)
-{
-	int hash = sa->s_node % (AARP_HASH_SIZE - 1);
-	struct aarp_entry *a = __aarp_find_entry(proxies[hash], dev, sa);
-
-	return a ? sa : NULL;
-}
-
-void aarp_probe_network(struct atalk_iface *atif)
-{
-	unsigned int count;
-
-	for (count = 0; count < AARP_RETRANSMIT_LIMIT; count++) {
-		aarp_send_probe(atif->dev, &atif->address);
-
-		/* Defer 1/10th */
-		msleep(100);
-
-		if (atif->status & ATIF_PROBE_FAIL)
-			break;
-	}
-}
-
-int aarp_proxy_probe_network(struct atalk_iface *atif, struct atalk_addr *sa)
-{
-	int hash, retval = -EPROTONOSUPPORT;
-	struct aarp_entry *entry;
-	unsigned int count;
-
-	/*
-	 * we don't currently support LocalTalk or PPP for proxy AARP;
-	 * if someone wants to try and add it, have fun
-	 */
-	if (atif->dev->type == ARPHRD_LOCALTLK ||
-	    atif->dev->type == ARPHRD_PPP)
-		goto out;
-
-	/*
-	 * create a new AARP entry with the flags set to be published --
-	 * we need this one to hang around even if it's in use
-	 */
-	entry = aarp_alloc();
-	retval = -ENOMEM;
-	if (!entry)
-		goto out;
-
-	entry->expires_at = -1;
-	entry->status = ATIF_PROBE;
-	entry->target_addr.s_node = sa->s_node;
-	entry->target_addr.s_net = sa->s_net;
-	entry->dev = atif->dev;
-
-	write_lock_bh(&aarp_lock);
-	aarp_entry_get(entry);
-
-	hash = sa->s_node % (AARP_HASH_SIZE - 1);
-	entry->next = proxies[hash];
-	proxies[hash] = entry;
-
-	for (count = 0; count < AARP_RETRANSMIT_LIMIT; count++) {
-		aarp_send_probe(atif->dev, sa);
-
-		/* Defer 1/10th */
-		write_unlock_bh(&aarp_lock);
-		msleep(100);
-		write_lock_bh(&aarp_lock);
-
-		if (entry->status & ATIF_PROBE_FAIL)
-			break;
-	}
-
-	if (entry->status & ATIF_PROBE_FAIL) {
-		entry->expires_at = jiffies - 1; /* free the entry */
-		retval = -EADDRINUSE; /* return network full */
-	} else { /* clear the probing flag */
-		entry->status &= ~ATIF_PROBE;
-		retval = 1;
-	}
-
-	aarp_entry_put(entry);
-	write_unlock_bh(&aarp_lock);
-out:
-	return retval;
-}
-
-/* Send a DDP frame */
-int aarp_send_ddp(struct net_device *dev, struct sk_buff *skb,
-		  struct atalk_addr *sa, void *hwaddr)
-{
-	static char ddp_eth_multicast[ETH_ALEN] =
-		{ 0x09, 0x00, 0x07, 0xFF, 0xFF, 0xFF };
-	int hash;
-	struct aarp_entry *a;
-
-	skb_reset_network_header(skb);
-
-	/* Check for LocalTalk first */
-	if (dev->type == ARPHRD_LOCALTLK) {
-		struct atalk_addr *at = atalk_find_dev_addr(dev);
-		struct ddpehdr *ddp = (struct ddpehdr *)skb->data;
-		int ft = 2;
-
-		if (!at) {
-			kfree_skb(skb);
-			return NET_XMIT_DROP;
-		}
-
-		/*
-		 * Compressible ?
-		 *
-		 * IFF: src_net == dest_net == device_net
-		 * (zero matches anything)
-		 */
-
-		if ((!ddp->deh_snet || at->s_net == ddp->deh_snet) &&
-		    (!ddp->deh_dnet || at->s_net == ddp->deh_dnet)) {
-			skb_pull(skb, sizeof(*ddp) - 4);
-
-			/*
-			 *	The upper two remaining bytes are the port
-			 *	numbers	we just happen to need. Now put the
-			 *	length in the lower two.
-			 */
-			*((__be16 *)skb->data) = htons(skb->len);
-			ft = 1;
-		}
-		/*
-		 * Nice and easy. No AARP type protocols occur here so we can
-		 * just shovel it out with a 3 byte LLAP header
-		 */
-
-		skb_push(skb, 3);
-		skb->data[0] = sa->s_node;
-		skb->data[1] = at->s_node;
-		skb->data[2] = ft;
-		skb->dev     = dev;
-		goto sendit;
-	}
-
-	/* On a PPP link we neither compress nor aarp.  */
-	if (dev->type == ARPHRD_PPP) {
-		skb->protocol = htons(ETH_P_PPPTALK);
-		skb->dev = dev;
-		goto sendit;
-	}
-
-	/* Non ELAP we cannot do. */
-	if (dev->type != ARPHRD_ETHER)
-		goto free_it;
-
-	skb->dev = dev;
-	skb->protocol = htons(ETH_P_ATALK);
-	hash = sa->s_node % (AARP_HASH_SIZE - 1);
-
-	/* Do we have a resolved entry? */
-	if (sa->s_node == ATADDR_BCAST) {
-		/* Send it */
-		ddp_dl->request(ddp_dl, skb, ddp_eth_multicast);
-		goto sent;
-	}
-
-	write_lock_bh(&aarp_lock);
-	a = __aarp_find_entry(resolved[hash], dev, sa);
-
-	if (a) { /* Return 1 and fill in the address */
-		a->expires_at = jiffies + (sysctl_aarp_expiry_time * 10);
-		ddp_dl->request(ddp_dl, skb, a->hwaddr);
-		write_unlock_bh(&aarp_lock);
-		goto sent;
-	}
-
-	/* Do we have an unresolved entry: This is the less common path */
-	a = __aarp_find_entry(unresolved[hash], dev, sa);
-	if (a) { /* Queue onto the unresolved queue */
-		skb_queue_tail(&a->packet_queue, skb);
-		goto out_unlock;
-	}
-
-	/* Allocate a new entry */
-	a = aarp_alloc();
-	if (!a) {
-		/* Whoops slipped... good job it's an unreliable protocol 8) */
-		write_unlock_bh(&aarp_lock);
-		goto free_it;
-	}
-
-	/* Set up the queue */
-	skb_queue_tail(&a->packet_queue, skb);
-	a->expires_at	 = jiffies + sysctl_aarp_resolve_time;
-	a->dev		 = dev;
-	a->next		 = unresolved[hash];
-	a->target_addr	 = *sa;
-	a->xmit_count	 = 0;
-	unresolved[hash] = a;
-	unresolved_count++;
-
-	/* Send an initial request for the address */
-	__aarp_send_query(a);
-
-	/*
-	 * Switch to fast timer if needed (That is if this is the first
-	 * unresolved entry to get added)
-	 */
-
-	if (unresolved_count == 1)
-		mod_timer(&aarp_timer, jiffies + sysctl_aarp_tick_time);
-
-	/* Now finally, it is safe to drop the lock. */
-out_unlock:
-	write_unlock_bh(&aarp_lock);
-
-	/* Tell the ddp layer we have taken over for this frame. */
-	goto sent;
-
-sendit:
-	if (skb->sk)
-		skb->priority = READ_ONCE(skb->sk->sk_priority);
-	if (dev_queue_xmit(skb))
-		goto drop;
-sent:
-	return NET_XMIT_SUCCESS;
-free_it:
-	kfree_skb(skb);
-drop:
-	return NET_XMIT_DROP;
-}
-EXPORT_SYMBOL(aarp_send_ddp);
-
-/*
- *	An entry in the aarp unresolved queue has become resolved. Send
- *	all the frames queued under it.
- *
- *	Must run under aarp_lock.
- */
-static void __aarp_resolved(struct aarp_entry **list, struct aarp_entry *a,
-			    int hash)
-{
-	struct sk_buff *skb;
-
-	while (*list)
-		if (*list == a) {
-			unresolved_count--;
-			*list = a->next;
-
-			/* Move into the resolved list */
-			a->next = resolved[hash];
-			resolved[hash] = a;
-
-			/* Kick frames off */
-			while ((skb = skb_dequeue(&a->packet_queue)) != NULL) {
-				a->expires_at = jiffies +
-						sysctl_aarp_expiry_time * 10;
-				ddp_dl->request(ddp_dl, skb, a->hwaddr);
-			}
-		} else
-			list = &((*list)->next);
-}
-
-/*
- *	This is called by the SNAP driver whenever we see an AARP SNAP
- *	frame. We currently only support Ethernet.
- */
-static int aarp_rcv(struct sk_buff *skb, struct net_device *dev,
-		    struct packet_type *pt, struct net_device *orig_dev)
-{
-	struct elapaarp *ea = aarp_hdr(skb);
-	int hash, ret = 0;
-	__u16 function;
-	struct aarp_entry *a;
-	struct atalk_addr sa, *ma, da;
-	struct atalk_iface *ifa;
-
-	if (!net_eq(dev_net(dev), &init_net))
-		goto out0;
-
-	/* We only do Ethernet SNAP AARP. */
-	if (dev->type != ARPHRD_ETHER)
-		goto out0;
-
-	/* Frame size ok? */
-	if (!skb_pull(skb, sizeof(*ea)))
-		goto out0;
-
-	function = ntohs(ea->function);
-
-	/* Sanity check fields. */
-	if (function < AARP_REQUEST || function > AARP_PROBE ||
-	    ea->hw_len != ETH_ALEN || ea->pa_len != AARP_PA_ALEN ||
-	    ea->pa_src_zero || ea->pa_dst_zero)
-		goto out0;
-
-	/* Looks good. */
-	hash = ea->pa_src_node % (AARP_HASH_SIZE - 1);
-
-	/* Build an address. */
-	sa.s_node = ea->pa_src_node;
-	sa.s_net = ea->pa_src_net;
-
-	/* Process the packet. Check for replies of me. */
-	ifa = atalk_find_dev(dev);
-	if (!ifa)
-		goto out1;
-
-	if (ifa->status & ATIF_PROBE &&
-	    ifa->address.s_node == ea->pa_dst_node &&
-	    ifa->address.s_net == ea->pa_dst_net) {
-		ifa->status |= ATIF_PROBE_FAIL; /* Fail the probe (in use) */
-		goto out1;
-	}
-
-	/* Check for replies of proxy AARP entries */
-	da.s_node = ea->pa_dst_node;
-	da.s_net  = ea->pa_dst_net;
-
-	write_lock_bh(&aarp_lock);
-	a = __aarp_find_entry(proxies[hash], dev, &da);
-
-	if (a && a->status & ATIF_PROBE) {
-		a->status |= ATIF_PROBE_FAIL;
-		/*
-		 * we do not respond to probe or request packets of
-		 * this address while we are probing this address
-		 */
-		goto unlock;
-	}
-
-	switch (function) {
-	case AARP_REPLY:
-		if (!unresolved_count)	/* Speed up */
-			break;
-
-		/* Find the entry.  */
-		a = __aarp_find_entry(unresolved[hash], dev, &sa);
-		if (!a || dev != a->dev)
-			break;
-
-		/* We can fill one in - this is good. */
-		ether_addr_copy(a->hwaddr, ea->hw_src);
-		__aarp_resolved(&unresolved[hash], a, hash);
-		if (!unresolved_count)
-			mod_timer(&aarp_timer,
-				  jiffies + sysctl_aarp_expiry_time);
-		break;
-
-	case AARP_REQUEST:
-	case AARP_PROBE:
-
-		/*
-		 * If it is my address set ma to my address and reply.
-		 * We can treat probe and request the same.  Probe
-		 * simply means we shouldn't cache the querying host,
-		 * as in a probe they are proposing an address not
-		 * using one.
-		 *
-		 * Support for proxy-AARP added. We check if the
-		 * address is one of our proxies before we toss the
-		 * packet out.
-		 */
-
-		sa.s_node = ea->pa_dst_node;
-		sa.s_net  = ea->pa_dst_net;
-
-		/* See if we have a matching proxy. */
-		ma = __aarp_proxy_find(dev, &sa);
-		if (!ma)
-			ma = &ifa->address;
-		else { /* We need to make a copy of the entry. */
-			da.s_node = sa.s_node;
-			da.s_net = sa.s_net;
-			ma = &da;
-		}
-
-		if (function == AARP_PROBE) {
-			/*
-			 * A probe implies someone trying to get an
-			 * address. So as a precaution flush any
-			 * entries we have for this address.
-			 */
-			a = __aarp_find_entry(resolved[sa.s_node %
-						       (AARP_HASH_SIZE - 1)],
-					      skb->dev, &sa);
-
-			/*
-			 * Make it expire next tick - that avoids us
-			 * getting into a probe/flush/learn/probe/
-			 * flush/learn cycle during probing of a slow
-			 * to respond host addr.
-			 */
-			if (a) {
-				a->expires_at = jiffies - 1;
-				mod_timer(&aarp_timer, jiffies +
-					  sysctl_aarp_tick_time);
-			}
-		}
-
-		if (sa.s_node != ma->s_node)
-			break;
-
-		if (sa.s_net && ma->s_net && sa.s_net != ma->s_net)
-			break;
-
-		sa.s_node = ea->pa_src_node;
-		sa.s_net = ea->pa_src_net;
-
-		/* aarp_my_address has found the address to use for us.
-		 */
-		aarp_send_reply(dev, ma, &sa, ea->hw_src);
-		break;
-	}
-
-unlock:
-	write_unlock_bh(&aarp_lock);
-out1:
-	ret = 1;
-out0:
-	kfree_skb(skb);
-	return ret;
-}
-
-static struct notifier_block aarp_notifier = {
-	.notifier_call = aarp_device_event,
-};
-
-static unsigned char aarp_snap_id[] = { 0x00, 0x00, 0x00, 0x80, 0xF3 };
-
-int __init aarp_proto_init(void)
-{
-	int rc;
-
-	aarp_dl = register_snap_client(aarp_snap_id, aarp_rcv);
-	if (!aarp_dl) {
-		printk(KERN_CRIT "Unable to register AARP with SNAP.\n");
-		return -ENOMEM;
-	}
-	timer_setup(&aarp_timer, aarp_expire_timeout, 0);
-	aarp_timer.expires  = jiffies + sysctl_aarp_expiry_time;
-	add_timer(&aarp_timer);
-	rc = register_netdevice_notifier(&aarp_notifier);
-	if (rc) {
-		timer_delete_sync(&aarp_timer);
-		unregister_snap_client(aarp_dl);
-	}
-	return rc;
-}
-
-/* Remove the AARP entries associated with a device. */
-void aarp_device_down(struct net_device *dev)
-{
-	int ct;
-
-	write_lock_bh(&aarp_lock);
-
-	for (ct = 0; ct < AARP_HASH_SIZE; ct++) {
-		__aarp_expire_device(&resolved[ct], dev);
-		__aarp_expire_device(&unresolved[ct], dev);
-		__aarp_expire_device(&proxies[ct], dev);
-	}
-
-	write_unlock_bh(&aarp_lock);
-}
-
-#ifdef CONFIG_PROC_FS
-/*
- * Get the aarp entry that is in the chain described
- * by the iterator.
- * If pos is set then skip till that index.
- * pos = 1 is the first entry
- */
-static struct aarp_entry *iter_next(struct aarp_iter_state *iter, loff_t *pos)
-{
-	int ct = iter->bucket;
-	struct aarp_entry **table = iter->table;
-	loff_t off = 0;
-	struct aarp_entry *entry;
-
- rescan:
-	while (ct < AARP_HASH_SIZE) {
-		for (entry = table[ct]; entry; entry = entry->next) {
-			if (!pos || ++off == *pos) {
-				iter->table = table;
-				iter->bucket = ct;
-				return entry;
-			}
-		}
-		++ct;
-	}
-
-	if (table == resolved) {
-		ct = 0;
-		table = unresolved;
-		goto rescan;
-	}
-	if (table == unresolved) {
-		ct = 0;
-		table = proxies;
-		goto rescan;
-	}
-	return NULL;
-}
-
-static void *aarp_seq_start(struct seq_file *seq, loff_t *pos)
-	__acquires(aarp_lock)
-{
-	struct aarp_iter_state *iter = seq->private;
-
-	read_lock_bh(&aarp_lock);
-	iter->table     = resolved;
-	iter->bucket    = 0;
-
-	return *pos ? iter_next(iter, pos) : SEQ_START_TOKEN;
-}
-
-static void *aarp_seq_next(struct seq_file *seq, void *v, loff_t *pos)
-{
-	struct aarp_entry *entry = v;
-	struct aarp_iter_state *iter = seq->private;
-
-	++*pos;
-
-	/* first line after header */
-	if (v == SEQ_START_TOKEN)
-		entry = iter_next(iter, NULL);
-
-	/* next entry in current bucket */
-	else if (entry->next)
-		entry = entry->next;
-
-	/* next bucket or table */
-	else {
-		++iter->bucket;
-		entry = iter_next(iter, NULL);
-	}
-	return entry;
-}
-
-static void aarp_seq_stop(struct seq_file *seq, void *v)
-	__releases(aarp_lock)
-{
-	read_unlock_bh(&aarp_lock);
-}
-
-static const char *dt2str(unsigned long ticks)
-{
-	static char buf[32];
-
-	sprintf(buf, "%ld.%02ld", ticks / HZ, ((ticks % HZ) * 100) / HZ);
-
-	return buf;
-}
-
-static int aarp_seq_show(struct seq_file *seq, void *v)
-{
-	struct aarp_iter_state *iter = seq->private;
-	struct aarp_entry *entry = v;
-	unsigned long now = jiffies;
-
-	if (v == SEQ_START_TOKEN)
-		seq_puts(seq,
-			 "Address  Interface   Hardware Address"
-			 "   Expires LastSend  Retry Status\n");
-	else {
-		seq_printf(seq, "%04X:%02X  %-12s",
-			   ntohs(entry->target_addr.s_net),
-			   (unsigned int) entry->target_addr.s_node,
-			   entry->dev ? entry->dev->name : "????");
-		seq_printf(seq, "%pM", entry->hwaddr);
-		seq_printf(seq, " %8s",
-			   dt2str((long)entry->expires_at - (long)now));
-		if (iter->table == unresolved)
-			seq_printf(seq, " %8s %6hu",
-				   dt2str(now - entry->last_sent),
-				   entry->xmit_count);
-		else
-			seq_puts(seq, "                ");
-		seq_printf(seq, " %s\n",
-			   (iter->table == resolved) ? "resolved"
-			   : (iter->table == unresolved) ? "unresolved"
-			   : (iter->table == proxies) ? "proxies"
-			   : "unknown");
-	}
-	return 0;
-}
-
-const struct seq_operations aarp_seq_ops = {
-	.start  = aarp_seq_start,
-	.next   = aarp_seq_next,
-	.stop   = aarp_seq_stop,
-	.show   = aarp_seq_show,
-};
-#endif
-
-/* General module cleanup. Called from cleanup_module() in ddp.c. */
-void aarp_cleanup_module(void)
-{
-	timer_delete_sync(&aarp_timer);
-	unregister_netdevice_notifier(&aarp_notifier);
-	unregister_snap_client(aarp_dl);
-	aarp_purge();
-}
diff --git a/net/appletalk/atalk_proc.c b/net/appletalk/atalk_proc.c
deleted file mode 100644
index 01787fb6a7bc..000000000000
--- a/net/appletalk/atalk_proc.c
+++ /dev/null
@@ -1,242 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * 	atalk_proc.c - proc support for Appletalk
- *
- * 	Copyright(c) Arnaldo Carvalho de Melo <acme@conectiva.com.br>
- */
-
-#include <linux/init.h>
-#include <linux/proc_fs.h>
-#include <linux/seq_file.h>
-#include <net/net_namespace.h>
-#include <net/sock.h>
-#include <linux/atalk.h>
-#include <linux/export.h>
-
-
-static __inline__ struct atalk_iface *atalk_get_interface_idx(loff_t pos)
-{
-	struct atalk_iface *i;
-
-	for (i = atalk_interfaces; pos && i; i = i->next)
-		--pos;
-
-	return i;
-}
-
-static void *atalk_seq_interface_start(struct seq_file *seq, loff_t *pos)
-	__acquires(atalk_interfaces_lock)
-{
-	loff_t l = *pos;
-
-	read_lock_bh(&atalk_interfaces_lock);
-	return l ? atalk_get_interface_idx(--l) : SEQ_START_TOKEN;
-}
-
-static void *atalk_seq_interface_next(struct seq_file *seq, void *v, loff_t *pos)
-{
-	struct atalk_iface *i;
-
-	++*pos;
-	if (v == SEQ_START_TOKEN) {
-		i = NULL;
-		if (atalk_interfaces)
-			i = atalk_interfaces;
-		goto out;
-	}
-	i = v;
-	i = i->next;
-out:
-	return i;
-}
-
-static void atalk_seq_interface_stop(struct seq_file *seq, void *v)
-	__releases(atalk_interfaces_lock)
-{
-	read_unlock_bh(&atalk_interfaces_lock);
-}
-
-static int atalk_seq_interface_show(struct seq_file *seq, void *v)
-{
-	struct atalk_iface *iface;
-
-	if (v == SEQ_START_TOKEN) {
-		seq_puts(seq, "Interface        Address   Networks  "
-			      "Status\n");
-		goto out;
-	}
-
-	iface = v;
-	seq_printf(seq, "%-16s %04X:%02X  %04X-%04X  %d\n",
-		   iface->dev->name, ntohs(iface->address.s_net),
-		   iface->address.s_node, ntohs(iface->nets.nr_firstnet),
-		   ntohs(iface->nets.nr_lastnet), iface->status);
-out:
-	return 0;
-}
-
-static __inline__ struct atalk_route *atalk_get_route_idx(loff_t pos)
-{
-	struct atalk_route *r;
-
-	for (r = atalk_routes; pos && r; r = r->next)
-		--pos;
-
-	return r;
-}
-
-static void *atalk_seq_route_start(struct seq_file *seq, loff_t *pos)
-	__acquires(atalk_routes_lock)
-{
-	loff_t l = *pos;
-
-	read_lock_bh(&atalk_routes_lock);
-	return l ? atalk_get_route_idx(--l) : SEQ_START_TOKEN;
-}
-
-static void *atalk_seq_route_next(struct seq_file *seq, void *v, loff_t *pos)
-{
-	struct atalk_route *r;
-
-	++*pos;
-	if (v == SEQ_START_TOKEN) {
-		r = NULL;
-		if (atalk_routes)
-			r = atalk_routes;
-		goto out;
-	}
-	r = v;
-	r = r->next;
-out:
-	return r;
-}
-
-static void atalk_seq_route_stop(struct seq_file *seq, void *v)
-	__releases(atalk_routes_lock)
-{
-	read_unlock_bh(&atalk_routes_lock);
-}
-
-static int atalk_seq_route_show(struct seq_file *seq, void *v)
-{
-	struct atalk_route *rt;
-
-	if (v == SEQ_START_TOKEN) {
-		seq_puts(seq, "Target        Router  Flags Dev\n");
-		goto out;
-	}
-
-	if (atrtr_default.dev) {
-		rt = &atrtr_default;
-		seq_printf(seq, "Default     %04X:%02X  %-4d  %s\n",
-			       ntohs(rt->gateway.s_net), rt->gateway.s_node,
-			       rt->flags, rt->dev->name);
-	}
-
-	rt = v;
-	seq_printf(seq, "%04X:%02X     %04X:%02X  %-4d  %s\n",
-		   ntohs(rt->target.s_net), rt->target.s_node,
-		   ntohs(rt->gateway.s_net), rt->gateway.s_node,
-		   rt->flags, rt->dev->name);
-out:
-	return 0;
-}
-
-static void *atalk_seq_socket_start(struct seq_file *seq, loff_t *pos)
-	__acquires(atalk_sockets_lock)
-{
-	read_lock_bh(&atalk_sockets_lock);
-	return seq_hlist_start_head(&atalk_sockets, *pos);
-}
-
-static void *atalk_seq_socket_next(struct seq_file *seq, void *v, loff_t *pos)
-{
-	return seq_hlist_next(v, &atalk_sockets, pos);
-}
-
-static void atalk_seq_socket_stop(struct seq_file *seq, void *v)
-	__releases(atalk_sockets_lock)
-{
-	read_unlock_bh(&atalk_sockets_lock);
-}
-
-static int atalk_seq_socket_show(struct seq_file *seq, void *v)
-{
-	struct sock *s;
-	struct atalk_sock *at;
-
-	if (v == SEQ_START_TOKEN) {
-		seq_printf(seq, "Type Local_addr  Remote_addr Tx_queue "
-				"Rx_queue St UID\n");
-		goto out;
-	}
-
-	s = sk_entry(v);
-	at = at_sk(s);
-
-	seq_printf(seq, "%02X   %04X:%02X:%02X  %04X:%02X:%02X  %08X:%08X "
-			"%02X %u\n",
-		   s->sk_type, ntohs(at->src_net), at->src_node, at->src_port,
-		   ntohs(at->dest_net), at->dest_node, at->dest_port,
-		   sk_wmem_alloc_get(s),
-		   sk_rmem_alloc_get(s),
-		   s->sk_state,
-		   from_kuid_munged(seq_user_ns(seq), sk_uid(s)));
-out:
-	return 0;
-}
-
-static const struct seq_operations atalk_seq_interface_ops = {
-	.start  = atalk_seq_interface_start,
-	.next   = atalk_seq_interface_next,
-	.stop   = atalk_seq_interface_stop,
-	.show   = atalk_seq_interface_show,
-};
-
-static const struct seq_operations atalk_seq_route_ops = {
-	.start  = atalk_seq_route_start,
-	.next   = atalk_seq_route_next,
-	.stop   = atalk_seq_route_stop,
-	.show   = atalk_seq_route_show,
-};
-
-static const struct seq_operations atalk_seq_socket_ops = {
-	.start  = atalk_seq_socket_start,
-	.next   = atalk_seq_socket_next,
-	.stop   = atalk_seq_socket_stop,
-	.show   = atalk_seq_socket_show,
-};
-
-int __init atalk_proc_init(void)
-{
-	if (!proc_mkdir("atalk", init_net.proc_net))
-		return -ENOMEM;
-
-	if (!proc_create_seq("atalk/interface", 0444, init_net.proc_net,
-			    &atalk_seq_interface_ops))
-		goto out;
-
-	if (!proc_create_seq("atalk/route", 0444, init_net.proc_net,
-			    &atalk_seq_route_ops))
-		goto out;
-
-	if (!proc_create_seq("atalk/socket", 0444, init_net.proc_net,
-			    &atalk_seq_socket_ops))
-		goto out;
-
-	if (!proc_create_seq_private("atalk/arp", 0444, init_net.proc_net,
-				     &aarp_seq_ops,
-				     sizeof(struct aarp_iter_state), NULL))
-		goto out;
-
-	return 0;
-
-out:
-	remove_proc_subtree("atalk", init_net.proc_net);
-	return -ENOMEM;
-}
-
-void atalk_proc_exit(void)
-{
-	remove_proc_subtree("atalk", init_net.proc_net);
-}
diff --git a/net/appletalk/ddp.c b/net/appletalk/ddp.c
deleted file mode 100644
index afb86ce6e644..000000000000
--- a/net/appletalk/ddp.c
+++ /dev/null
@@ -1,2055 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- *	DDP:	An implementation of the AppleTalk DDP protocol for
- *		Ethernet 'ELAP'.
- *
- *		Alan Cox  <alan@lxorguk.ukuu.org.uk>
- *
- *		With more than a little assistance from
- *
- *		Wesley Craig <netatalk@umich.edu>
- *
- *	Fixes:
- *		Neil Horman		:	Added missing device ioctls
- *		Michael Callahan	:	Made routing work
- *		Wesley Craig		:	Fix probing to listen to a
- *						passed node id.
- *		Alan Cox		:	Added send/recvmsg support
- *		Alan Cox		:	Moved at. to protinfo in
- *						socket.
- *		Alan Cox		:	Added firewall hooks.
- *		Alan Cox		:	Supports new ARPHRD_LOOPBACK
- *		Christer Weinigel	: 	Routing and /proc fixes.
- *		Bradford Johnson	:	LocalTalk.
- *		Tom Dyas		:	Module support.
- *		Alan Cox		:	Hooks for PPP (based on the
- *						LocalTalk hook).
- *		Alan Cox		:	Posix bits
- *		Alan Cox/Mike Freeman	:	Possible fix to NBP problems
- *		Bradford Johnson	:	IP-over-DDP (experimental)
- *		Jay Schulist		:	Moved IP-over-DDP to its own
- *						driver file. (ipddp.c & ipddp.h)
- *		Jay Schulist		:	Made work as module with
- *						AppleTalk drivers, cleaned it.
- *		Rob Newberry		:	Added proxy AARP and AARP
- *						procfs, moved probing to AARP
- *						module.
- *              Adrian Sun/
- *              Michael Zuelsdorff      :       fix for net.0 packets. don't
- *                                              allow illegal ether/tokentalk
- *                                              port assignment. we lose a
- *                                              valid localtalk port as a
- *                                              result.
- *		Arnaldo C. de Melo	:	Cleanup, in preparation for
- *						shared skb support 8)
- *		Arnaldo C. de Melo	:	Move proc stuff to atalk_proc.c,
- *						use seq_file
- */
-
-#include <linux/capability.h>
-#include <linux/module.h>
-#include <linux/if_arp.h>
-#include <linux/termios.h>	/* For TIOCOUTQ/INQ */
-#include <linux/compat.h>
-#include <linux/slab.h>
-#include <linux/hashtable.h>
-#include <net/datalink.h>
-#include <net/psnap.h>
-#include <net/sock.h>
-#include <net/tcp_states.h>
-#include <net/route.h>
-#include <net/compat.h>
-#include <linux/atalk.h>
-#include <linux/highmem.h>
-
-struct datalink_proto *ddp_dl, *aarp_dl;
-static const struct proto_ops atalk_dgram_ops;
-
-/**************************************************************************\
-*                                                                          *
-* Handlers for the socket list.                                            *
-*                                                                          *
-\**************************************************************************/
-
-HLIST_HEAD(atalk_sockets);
-DEFINE_RWLOCK(atalk_sockets_lock);
-
-static inline void __atalk_insert_socket(struct sock *sk)
-{
-	sk_add_node(sk, &atalk_sockets);
-}
-
-static inline void atalk_remove_socket(struct sock *sk)
-{
-	write_lock_bh(&atalk_sockets_lock);
-	sk_del_node_init(sk);
-	write_unlock_bh(&atalk_sockets_lock);
-}
-
-static struct sock *atalk_search_socket(struct sockaddr_at *to,
-					struct atalk_iface *atif)
-{
-	struct sock *def_socket = NULL;
-	struct sock *s;
-
-	read_lock_bh(&atalk_sockets_lock);
-	sk_for_each(s, &atalk_sockets) {
-		struct atalk_sock *at = at_sk(s);
-
-		if (to->sat_port != at->src_port)
-			continue;
-
-		if (to->sat_addr.s_net == ATADDR_ANYNET &&
-		    to->sat_addr.s_node == ATADDR_BCAST) {
-			if (atif->address.s_node == at->src_node &&
-			    atif->address.s_net == at->src_net) {
-				/* This socket's address matches the address of the interface
-				 * that received the packet -- use it
-				 */
-				goto found;
-			}
-
-			/* Continue searching for a socket matching the interface address,
-			 * but use this socket by default if no other one is found
-			 */
-			def_socket = s;
-		}
-
-		if (to->sat_addr.s_net == at->src_net &&
-		    (to->sat_addr.s_node == at->src_node ||
-		     to->sat_addr.s_node == ATADDR_BCAST ||
-		     to->sat_addr.s_node == ATADDR_ANYNODE))
-			goto found;
-
-		/* XXXX.0 -- we got a request for this router. make sure
-		 * that the node is appropriately set. */
-		if (to->sat_addr.s_node == ATADDR_ANYNODE &&
-		    to->sat_addr.s_net != ATADDR_ANYNET &&
-		    atif->address.s_node == at->src_node) {
-			to->sat_addr.s_node = atif->address.s_node;
-			goto found;
-		}
-	}
-	s = def_socket;
-found:
-	read_unlock_bh(&atalk_sockets_lock);
-	return s;
-}
-
-/**
- * atalk_find_or_insert_socket - Try to find a socket matching ADDR
- * @sk: socket to insert in the list if it is not there already
- * @sat: address to search for
- *
- * Try to find a socket matching ADDR in the socket list, if found then return
- * it. If not, insert SK into the socket list.
- *
- * This entire operation must execute atomically.
- */
-static struct sock *atalk_find_or_insert_socket(struct sock *sk,
-						struct sockaddr_at *sat)
-{
-	struct sock *s;
-	struct atalk_sock *at;
-
-	write_lock_bh(&atalk_sockets_lock);
-	sk_for_each(s, &atalk_sockets) {
-		at = at_sk(s);
-
-		if (at->src_net == sat->sat_addr.s_net &&
-		    at->src_node == sat->sat_addr.s_node &&
-		    at->src_port == sat->sat_port)
-			goto found;
-	}
-	s = NULL;
-	__atalk_insert_socket(sk); /* Wheee, it's free, assign and insert. */
-found:
-	write_unlock_bh(&atalk_sockets_lock);
-	return s;
-}
-
-static void atalk_destroy_timer(struct timer_list *t)
-{
-	struct sock *sk = timer_container_of(sk, t, sk_timer);
-
-	if (sk_has_allocations(sk)) {
-		sk->sk_timer.expires = jiffies + SOCK_DESTROY_TIME;
-		add_timer(&sk->sk_timer);
-	} else
-		sock_put(sk);
-}
-
-static inline void atalk_destroy_socket(struct sock *sk)
-{
-	atalk_remove_socket(sk);
-	skb_queue_purge(&sk->sk_receive_queue);
-
-	if (sk_has_allocations(sk)) {
-		timer_setup(&sk->sk_timer, atalk_destroy_timer, 0);
-		sk->sk_timer.expires	= jiffies + SOCK_DESTROY_TIME;
-		add_timer(&sk->sk_timer);
-	} else
-		sock_put(sk);
-}
-
-/**************************************************************************\
-*                                                                          *
-* Routing tables for the AppleTalk socket layer.                           *
-*                                                                          *
-\**************************************************************************/
-
-/* Anti-deadlock ordering is atalk_routes_lock --> iface_lock -DaveM */
-struct atalk_route *atalk_routes;
-DEFINE_RWLOCK(atalk_routes_lock);
-
-struct atalk_iface *atalk_interfaces;
-DEFINE_RWLOCK(atalk_interfaces_lock);
-
-/* Fast dev->iface lookup, keyed on ifindex. Shares atalk_interfaces_lock with
- * the atalk_interfaces list, which remains the owner of the iface objects.
- */
-#define ATALK_IFACE_HASH_BITS	8
-static DEFINE_HASHTABLE(atalk_iface_hash, ATALK_IFACE_HASH_BITS);
-
-/* Find the iface for @dev. Caller must hold atalk_interfaces_lock. */
-static struct atalk_iface *__atalk_find_dev(struct net_device *dev)
-{
-	struct atalk_iface *iface;
-
-	hash_for_each_possible(atalk_iface_hash, iface, hash_node, dev->ifindex)
-		if (iface->dev == dev)
-			return iface;
-	return NULL;
-}
-
-struct atalk_iface *atalk_find_dev(struct net_device *dev)
-{
-	struct atalk_iface *iface;
-
-	read_lock_bh(&atalk_interfaces_lock);
-	iface = __atalk_find_dev(dev);
-	read_unlock_bh(&atalk_interfaces_lock);
-	return iface;
-}
-
-/* For probing devices or in a routerless network */
-struct atalk_route atrtr_default;
-
-/* AppleTalk interface control */
-/*
- * Drop a device. Doesn't drop any of its routes - that is the caller's
- * problem. Called when we down the interface or delete the address.
- */
-static void atif_drop_device(struct net_device *dev)
-{
-	struct atalk_iface **iface = &atalk_interfaces;
-	struct atalk_iface *tmp;
-
-	write_lock_bh(&atalk_interfaces_lock);
-	while ((tmp = *iface) != NULL) {
-		if (tmp->dev == dev) {
-			*iface = tmp->next;
-			hash_del(&tmp->hash_node);
-			dev_put(dev);
-			kfree(tmp);
-		} else
-			iface = &tmp->next;
-	}
-	write_unlock_bh(&atalk_interfaces_lock);
-}
-
-static struct atalk_iface *atif_add_device(struct net_device *dev,
-					   struct atalk_addr *sa)
-{
-	struct atalk_iface *iface = kzalloc_obj(*iface);
-
-	if (!iface)
-		goto out;
-
-	dev_hold(dev);
-	iface->dev = dev;
-	iface->address = *sa;
-	iface->status = 0;
-
-	write_lock_bh(&atalk_interfaces_lock);
-	iface->next = atalk_interfaces;
-	atalk_interfaces = iface;
-	hash_add(atalk_iface_hash, &iface->hash_node, dev->ifindex);
-	write_unlock_bh(&atalk_interfaces_lock);
-out:
-	return iface;
-}
-
-/* Perform phase 2 AARP probing on our tentative address */
-static int atif_probe_device(struct atalk_iface *atif)
-{
-	int netrange = ntohs(atif->nets.nr_lastnet) -
-			ntohs(atif->nets.nr_firstnet) + 1;
-	int probe_net = ntohs(atif->address.s_net);
-	int probe_node = atif->address.s_node;
-	int netct, nodect;
-
-	/* Offset the network we start probing with */
-	if (probe_net == ATADDR_ANYNET) {
-		probe_net = ntohs(atif->nets.nr_firstnet);
-		if (netrange)
-			probe_net += jiffies % netrange;
-	}
-	if (probe_node == ATADDR_ANYNODE)
-		probe_node = jiffies & 0xFF;
-
-	/* Scan the networks */
-	atif->status |= ATIF_PROBE;
-	for (netct = 0; netct <= netrange; netct++) {
-		/* Sweep the available nodes from a given start */
-		atif->address.s_net = htons(probe_net);
-		for (nodect = 0; nodect < 256; nodect++) {
-			atif->address.s_node = (nodect + probe_node) & 0xFF;
-			if (atif->address.s_node > 0 &&
-			    atif->address.s_node < 254) {
-				/* Probe a proposed address */
-				aarp_probe_network(atif);
-
-				if (!(atif->status & ATIF_PROBE_FAIL)) {
-					atif->status &= ~ATIF_PROBE;
-					return 0;
-				}
-			}
-			atif->status &= ~ATIF_PROBE_FAIL;
-		}
-		probe_net++;
-		if (probe_net > ntohs(atif->nets.nr_lastnet))
-			probe_net = ntohs(atif->nets.nr_firstnet);
-	}
-	atif->status &= ~ATIF_PROBE;
-
-	return -EADDRINUSE;	/* Network is full... */
-}
-
-
-/* Perform AARP probing for a proxy address */
-static int atif_proxy_probe_device(struct atalk_iface *atif,
-				   struct atalk_addr *proxy_addr)
-{
-	int netrange = ntohs(atif->nets.nr_lastnet) -
-			ntohs(atif->nets.nr_firstnet) + 1;
-	/* we probe the interface's network */
-	int probe_net = ntohs(atif->address.s_net);
-	int probe_node = ATADDR_ANYNODE;	    /* we'll take anything */
-	int netct, nodect;
-
-	/* Offset the network we start probing with */
-	if (probe_net == ATADDR_ANYNET) {
-		probe_net = ntohs(atif->nets.nr_firstnet);
-		if (netrange)
-			probe_net += jiffies % netrange;
-	}
-
-	if (probe_node == ATADDR_ANYNODE)
-		probe_node = jiffies & 0xFF;
-
-	/* Scan the networks */
-	for (netct = 0; netct <= netrange; netct++) {
-		/* Sweep the available nodes from a given start */
-		proxy_addr->s_net = htons(probe_net);
-		for (nodect = 0; nodect < 256; nodect++) {
-			proxy_addr->s_node = (nodect + probe_node) & 0xFF;
-			if (proxy_addr->s_node > 0 &&
-			    proxy_addr->s_node < 254) {
-				/* Tell AARP to probe a proposed address */
-				int ret = aarp_proxy_probe_network(atif,
-								    proxy_addr);
-
-				if (ret != -EADDRINUSE)
-					return ret;
-			}
-		}
-		probe_net++;
-		if (probe_net > ntohs(atif->nets.nr_lastnet))
-			probe_net = ntohs(atif->nets.nr_firstnet);
-	}
-
-	return -EADDRINUSE;	/* Network is full... */
-}
-
-
-struct atalk_addr *atalk_find_dev_addr(struct net_device *dev)
-{
-	struct atalk_addr *addr = NULL;
-	struct atalk_iface *iface;
-
-	read_lock_bh(&atalk_interfaces_lock);
-	iface = __atalk_find_dev(dev);
-	if (iface)
-		addr = &iface->address;
-	read_unlock_bh(&atalk_interfaces_lock);
-	return addr;
-}
-
-static struct atalk_addr *atalk_find_primary(void)
-{
-	struct atalk_iface *fiface = NULL;
-	struct atalk_addr *retval;
-	struct atalk_iface *iface;
-
-	/*
-	 * Return a point-to-point interface only if
-	 * there is no non-ptp interface available.
-	 */
-	read_lock_bh(&atalk_interfaces_lock);
-	for (iface = atalk_interfaces; iface; iface = iface->next) {
-		if (!fiface && !(iface->dev->flags & IFF_LOOPBACK))
-			fiface = iface;
-		if (!(iface->dev->flags & (IFF_LOOPBACK | IFF_POINTOPOINT))) {
-			retval = &iface->address;
-			goto out;
-		}
-	}
-
-	if (fiface)
-		retval = &fiface->address;
-	else if (atalk_interfaces)
-		retval = &atalk_interfaces->address;
-	else
-		retval = NULL;
-out:
-	read_unlock_bh(&atalk_interfaces_lock);
-	return retval;
-}
-
-/*
- * Find a match for 'any network' - ie any of our interfaces with that
- * node number will do just nicely.
- */
-static struct atalk_iface *atalk_find_anynet(int node, struct net_device *dev)
-{
-	struct atalk_iface *iface;
-
-	read_lock_bh(&atalk_interfaces_lock);
-	iface = __atalk_find_dev(dev);
-	if (!iface || iface->status & ATIF_PROBE)
-		goto out_err;
-
-	if (node != ATADDR_BCAST &&
-	    iface->address.s_node != node &&
-	    node != ATADDR_ANYNODE)
-		goto out_err;
-out:
-	read_unlock_bh(&atalk_interfaces_lock);
-	return iface;
-out_err:
-	iface = NULL;
-	goto out;
-}
-
-/* Find a match for a specific network:node pair */
-static struct atalk_iface *atalk_find_interface(__be16 net, int node)
-{
-	struct atalk_iface *iface;
-
-	read_lock_bh(&atalk_interfaces_lock);
-	for (iface = atalk_interfaces; iface; iface = iface->next) {
-		if ((node == ATADDR_BCAST ||
-		     node == ATADDR_ANYNODE ||
-		     iface->address.s_node == node) &&
-		    iface->address.s_net == net &&
-		    !(iface->status & ATIF_PROBE))
-			break;
-
-		/* XXXX.0 -- net.0 returns the iface associated with net */
-		if (node == ATADDR_ANYNODE && net != ATADDR_ANYNET &&
-		    ntohs(iface->nets.nr_firstnet) <= ntohs(net) &&
-		    ntohs(net) <= ntohs(iface->nets.nr_lastnet))
-			break;
-	}
-	read_unlock_bh(&atalk_interfaces_lock);
-	return iface;
-}
-
-
-/*
- * Find a route for an AppleTalk packet. This ought to get cached in
- * the socket (later on...). We know about host routes and the fact
- * that a route must be direct to broadcast.
- */
-static struct atalk_route *atrtr_find(struct atalk_addr *target)
-{
-	/*
-	 * we must search through all routes unless we find a
-	 * host route, because some host routes might overlap
-	 * network routes
-	 */
-	struct atalk_route *net_route = NULL;
-	struct atalk_route *r;
-
-	read_lock_bh(&atalk_routes_lock);
-	for (r = atalk_routes; r; r = r->next) {
-		if (!(r->flags & RTF_UP))
-			continue;
-
-		if (r->target.s_net == target->s_net) {
-			if (r->flags & RTF_HOST) {
-				/*
-				 * if this host route is for the target,
-				 * the we're done
-				 */
-				if (r->target.s_node == target->s_node)
-					goto out;
-			} else
-				/*
-				 * this route will work if there isn't a
-				 * direct host route, so cache it
-				 */
-				net_route = r;
-		}
-	}
-
-	/*
-	 * if we found a network route but not a direct host
-	 * route, then return it
-	 */
-	if (net_route)
-		r = net_route;
-	else if (atrtr_default.dev)
-		r = &atrtr_default;
-	else /* No route can be found */
-		r = NULL;
-out:
-	read_unlock_bh(&atalk_routes_lock);
-	return r;
-}
-
-
-/*
- * Given an AppleTalk network, find the device to use. This can be
- * a simple lookup.
- */
-struct net_device *atrtr_get_dev(struct atalk_addr *sa)
-{
-	struct atalk_route *atr = atrtr_find(sa);
-	return atr ? atr->dev : NULL;
-}
-
-/* Set up a default router */
-static void atrtr_set_default(struct net_device *dev)
-{
-	atrtr_default.dev	     = dev;
-	atrtr_default.flags	     = RTF_UP;
-	atrtr_default.gateway.s_net  = htons(0);
-	atrtr_default.gateway.s_node = 0;
-}
-
-/*
- * Add a router. Basically make sure it looks valid and stuff the
- * entry in the list. While it uses netranges we always set them to one
- * entry to work like netatalk.
- */
-static int atrtr_create(struct rtentry *r, struct net_device *devhint)
-{
-	struct sockaddr_at *ta = (struct sockaddr_at *)&r->rt_dst;
-	struct sockaddr_at *ga = (struct sockaddr_at *)&r->rt_gateway;
-	struct atalk_route *rt;
-	struct atalk_iface *iface, *riface;
-	int retval = -EINVAL;
-
-	/*
-	 * Fixme: Raise/Lower a routing change semaphore for these
-	 * operations.
-	 */
-
-	/* Validate the request */
-	if (ta->sat_family != AF_APPLETALK ||
-	    (!devhint && ga->sat_family != AF_APPLETALK))
-		goto out;
-
-	/* Now walk the routing table and make our decisions */
-	write_lock_bh(&atalk_routes_lock);
-	for (rt = atalk_routes; rt; rt = rt->next) {
-		if (r->rt_flags != rt->flags)
-			continue;
-
-		if (ta->sat_addr.s_net == rt->target.s_net) {
-			if (!(rt->flags & RTF_HOST))
-				break;
-			if (ta->sat_addr.s_node == rt->target.s_node)
-				break;
-		}
-	}
-
-	if (!devhint) {
-		riface = NULL;
-
-		read_lock_bh(&atalk_interfaces_lock);
-		for (iface = atalk_interfaces; iface; iface = iface->next) {
-			if (!riface &&
-			    ntohs(ga->sat_addr.s_net) >=
-					ntohs(iface->nets.nr_firstnet) &&
-			    ntohs(ga->sat_addr.s_net) <=
-					ntohs(iface->nets.nr_lastnet))
-				riface = iface;
-
-			if (ga->sat_addr.s_net == iface->address.s_net &&
-			    ga->sat_addr.s_node == iface->address.s_node)
-				riface = iface;
-		}
-		read_unlock_bh(&atalk_interfaces_lock);
-
-		retval = -ENETUNREACH;
-		if (!riface)
-			goto out_unlock;
-
-		devhint = riface->dev;
-	}
-
-	if (!rt) {
-		rt = kzalloc_obj(*rt, GFP_ATOMIC);
-
-		retval = -ENOBUFS;
-		if (!rt)
-			goto out_unlock;
-
-		rt->next = atalk_routes;
-		atalk_routes = rt;
-	}
-
-	/* Fill in the routing entry */
-	rt->target  = ta->sat_addr;
-	dev_put(rt->dev); /* Release old device */
-	dev_hold(devhint);
-	rt->dev     = devhint;
-	rt->flags   = r->rt_flags;
-	rt->gateway = ga->sat_addr;
-
-	retval = 0;
-out_unlock:
-	write_unlock_bh(&atalk_routes_lock);
-out:
-	return retval;
-}
-
-/* Delete a route. Find it and discard it */
-static int atrtr_delete(struct atalk_addr *addr)
-{
-	struct atalk_route **r = &atalk_routes;
-	int retval = 0;
-	struct atalk_route *tmp;
-
-	write_lock_bh(&atalk_routes_lock);
-	while ((tmp = *r) != NULL) {
-		if (tmp->target.s_net == addr->s_net &&
-		    (!(tmp->flags&RTF_GATEWAY) ||
-		     tmp->target.s_node == addr->s_node)) {
-			*r = tmp->next;
-			dev_put(tmp->dev);
-			kfree(tmp);
-			goto out;
-		}
-		r = &tmp->next;
-	}
-	retval = -ENOENT;
-out:
-	write_unlock_bh(&atalk_routes_lock);
-	return retval;
-}
-
-/*
- * Called when a device is downed. Just throw away any routes
- * via it.
- */
-static void atrtr_device_down(struct net_device *dev)
-{
-	struct atalk_route **r = &atalk_routes;
-	struct atalk_route *tmp;
-
-	write_lock_bh(&atalk_routes_lock);
-	while ((tmp = *r) != NULL) {
-		if (tmp->dev == dev) {
-			*r = tmp->next;
-			dev_put(dev);
-			kfree(tmp);
-		} else
-			r = &tmp->next;
-	}
-	write_unlock_bh(&atalk_routes_lock);
-
-	if (atrtr_default.dev == dev)
-		atrtr_set_default(NULL);
-}
-
-/* Actually down the interface */
-static inline void atalk_dev_down(struct net_device *dev)
-{
-	atrtr_device_down(dev);	/* Remove all routes for the device */
-	aarp_device_down(dev);	/* Remove AARP entries for the device */
-	atif_drop_device(dev);	/* Remove the device */
-}
-
-/*
- * A device event has occurred. Watch for devices going down and
- * delete our use of them (iface and route).
- */
-static int ddp_device_event(struct notifier_block *this, unsigned long event,
-			    void *ptr)
-{
-	struct net_device *dev = netdev_notifier_info_to_dev(ptr);
-
-	if (!net_eq(dev_net(dev), &init_net))
-		return NOTIFY_DONE;
-
-	if (event == NETDEV_DOWN)
-		/* Discard any use of this */
-		atalk_dev_down(dev);
-
-	return NOTIFY_DONE;
-}
-
-/* ioctl calls. Shouldn't even need touching */
-/* Device configuration ioctl calls */
-static int atif_ioctl(int cmd, void __user *arg)
-{
-	static char aarp_mcast[6] = { 0x09, 0x00, 0x00, 0xFF, 0xFF, 0xFF };
-	struct ifreq atreq;
-	struct atalk_netrange *nr;
-	struct sockaddr_at *sa;
-	struct net_device *dev;
-	struct atalk_iface *atif;
-	int ct;
-	int limit;
-	struct rtentry rtdef;
-	int add_route;
-
-	if (get_user_ifreq(&atreq, NULL, arg))
-		return -EFAULT;
-
-	dev = __dev_get_by_name(&init_net, atreq.ifr_name);
-	if (!dev)
-		return -ENODEV;
-
-	sa = (struct sockaddr_at *)&atreq.ifr_addr;
-	atif = atalk_find_dev(dev);
-
-	switch (cmd) {
-	case SIOCSIFADDR:
-		if (!capable(CAP_NET_ADMIN))
-			return -EPERM;
-		if (sa->sat_family != AF_APPLETALK)
-			return -EINVAL;
-		if (dev->type != ARPHRD_ETHER &&
-		    dev->type != ARPHRD_LOOPBACK &&
-		    dev->type != ARPHRD_LOCALTLK &&
-		    dev->type != ARPHRD_PPP)
-			return -EPROTONOSUPPORT;
-
-		nr = (struct atalk_netrange *)&sa->sat_zero[0];
-		add_route = 1;
-
-		/*
-		 * if this is a point-to-point iface, and we already
-		 * have an iface for this AppleTalk address, then we
-		 * should not add a route
-		 */
-		if ((dev->flags & IFF_POINTOPOINT) &&
-		    atalk_find_interface(sa->sat_addr.s_net,
-					 sa->sat_addr.s_node)) {
-			printk(KERN_DEBUG "AppleTalk: point-to-point "
-			       "interface added with "
-			       "existing address\n");
-			add_route = 0;
-		}
-
-		/*
-		 * Phase 1 is fine on LocalTalk but we don't do
-		 * EtherTalk phase 1. Anyone wanting to add it, go ahead.
-		 */
-		if (dev->type == ARPHRD_ETHER && nr->nr_phase != 2)
-			return -EPROTONOSUPPORT;
-		if (sa->sat_addr.s_node == ATADDR_BCAST ||
-		    sa->sat_addr.s_node == 254)
-			return -EINVAL;
-		if (atif) {
-			/* Already setting address */
-			if (atif->status & ATIF_PROBE)
-				return -EBUSY;
-
-			atif->address.s_net  = sa->sat_addr.s_net;
-			atif->address.s_node = sa->sat_addr.s_node;
-			atrtr_device_down(dev);	/* Flush old routes */
-		} else {
-			atif = atif_add_device(dev, &sa->sat_addr);
-			if (!atif)
-				return -ENOMEM;
-		}
-		atif->nets = *nr;
-
-		/*
-		 * Check if the chosen address is used. If so we
-		 * error and atalkd will try another.
-		 */
-
-		if (!(dev->flags & IFF_LOOPBACK) &&
-		    !(dev->flags & IFF_POINTOPOINT) &&
-		    atif_probe_device(atif) < 0) {
-			atif_drop_device(dev);
-			return -EADDRINUSE;
-		}
-
-		/* Hey it worked - add the direct routes */
-		sa = (struct sockaddr_at *)&rtdef.rt_gateway;
-		sa->sat_family = AF_APPLETALK;
-		sa->sat_addr.s_net  = atif->address.s_net;
-		sa->sat_addr.s_node = atif->address.s_node;
-		sa = (struct sockaddr_at *)&rtdef.rt_dst;
-		rtdef.rt_flags = RTF_UP;
-		sa->sat_family = AF_APPLETALK;
-		sa->sat_addr.s_node = ATADDR_ANYNODE;
-		if (dev->flags & IFF_LOOPBACK ||
-		    dev->flags & IFF_POINTOPOINT)
-			rtdef.rt_flags |= RTF_HOST;
-
-		/* Routerless initial state */
-		if (nr->nr_firstnet == htons(0) &&
-		    nr->nr_lastnet == htons(0xFFFE)) {
-			sa->sat_addr.s_net = atif->address.s_net;
-			atrtr_create(&rtdef, dev);
-			atrtr_set_default(dev);
-		} else {
-			limit = ntohs(nr->nr_lastnet);
-			if (limit - ntohs(nr->nr_firstnet) > 4096) {
-				printk(KERN_WARNING "Too many routes/"
-				       "iface.\n");
-				return -EINVAL;
-			}
-			if (add_route)
-				for (ct = ntohs(nr->nr_firstnet);
-				     ct <= limit; ct++) {
-					sa->sat_addr.s_net = htons(ct);
-					atrtr_create(&rtdef, dev);
-				}
-		}
-		dev_mc_add_global(dev, aarp_mcast);
-		return 0;
-
-	case SIOCGIFADDR:
-		if (!atif)
-			return -EADDRNOTAVAIL;
-
-		sa->sat_family = AF_APPLETALK;
-		sa->sat_addr = atif->address;
-		break;
-
-	case SIOCGIFBRDADDR:
-		if (!atif)
-			return -EADDRNOTAVAIL;
-
-		sa->sat_family = AF_APPLETALK;
-		sa->sat_addr.s_net = atif->address.s_net;
-		sa->sat_addr.s_node = ATADDR_BCAST;
-		break;
-
-	case SIOCATALKDIFADDR:
-	case SIOCDIFADDR:
-		if (!capable(CAP_NET_ADMIN))
-			return -EPERM;
-		if (sa->sat_family != AF_APPLETALK)
-			return -EINVAL;
-		atalk_dev_down(dev);
-		break;
-
-	case SIOCSARP:
-		if (!capable(CAP_NET_ADMIN))
-			return -EPERM;
-		if (sa->sat_family != AF_APPLETALK)
-			return -EINVAL;
-		/*
-		 * for now, we only support proxy AARP on ELAP;
-		 * we should be able to do it for LocalTalk, too.
-		 */
-		if (dev->type != ARPHRD_ETHER)
-			return -EPROTONOSUPPORT;
-
-		/*
-		 * atif points to the current interface on this network;
-		 * we aren't concerned about its current status (at
-		 * least for now), but it has all the settings about
-		 * the network we're going to probe. Consequently, it
-		 * must exist.
-		 */
-		if (!atif)
-			return -EADDRNOTAVAIL;
-
-		nr = (struct atalk_netrange *)&(atif->nets);
-		/*
-		 * Phase 1 is fine on Localtalk but we don't do
-		 * Ethertalk phase 1. Anyone wanting to add it, go ahead.
-		 */
-		if (dev->type == ARPHRD_ETHER && nr->nr_phase != 2)
-			return -EPROTONOSUPPORT;
-
-		if (sa->sat_addr.s_node == ATADDR_BCAST ||
-		    sa->sat_addr.s_node == 254)
-			return -EINVAL;
-
-		/*
-		 * Check if the chosen address is used. If so we
-		 * error and ATCP will try another.
-		 */
-		if (atif_proxy_probe_device(atif, &(sa->sat_addr)) < 0)
-			return -EADDRINUSE;
-
-		/*
-		 * We now have an address on the local network, and
-		 * the AARP code will defend it for us until we take it
-		 * down. We don't set up any routes right now, because
-		 * ATCP will install them manually via SIOCADDRT.
-		 */
-		break;
-
-	case SIOCDARP:
-		if (!capable(CAP_NET_ADMIN))
-			return -EPERM;
-		if (sa->sat_family != AF_APPLETALK)
-			return -EINVAL;
-		if (!atif)
-			return -EADDRNOTAVAIL;
-
-		/* give to aarp module to remove proxy entry */
-		aarp_proxy_remove(atif->dev, &(sa->sat_addr));
-		return 0;
-	}
-
-	return put_user_ifreq(&atreq, arg);
-}
-
-static int atrtr_ioctl_addrt(struct rtentry *rt)
-{
-	struct net_device *dev = NULL;
-
-	if (rt->rt_dev) {
-		char name[IFNAMSIZ];
-
-		if (copy_from_user(name, rt->rt_dev, IFNAMSIZ-1))
-			return -EFAULT;
-		name[IFNAMSIZ-1] = '\0';
-
-		dev = __dev_get_by_name(&init_net, name);
-		if (!dev)
-			return -ENODEV;
-	}
-	return atrtr_create(rt, dev);
-}
-
-/* Routing ioctl() calls */
-static int atrtr_ioctl(unsigned int cmd, void __user *arg)
-{
-	struct rtentry rt;
-
-	if (copy_from_user(&rt, arg, sizeof(rt)))
-		return -EFAULT;
-
-	switch (cmd) {
-	case SIOCDELRT:
-		if (rt.rt_dst.sa_family != AF_APPLETALK)
-			return -EINVAL;
-		return atrtr_delete(&((struct sockaddr_at *)
-				      &rt.rt_dst)->sat_addr);
-
-	case SIOCADDRT:
-		return atrtr_ioctl_addrt(&rt);
-	}
-	return -EINVAL;
-}
-
-/**************************************************************************\
-*                                                                          *
-* Handling for system calls applied via the various interfaces to an       *
-* AppleTalk socket object.                                                 *
-*                                                                          *
-\**************************************************************************/
-
-/*
- * Checksum: This is 'optional'. It's quite likely also a good
- * candidate for assembler hackery 8)
- */
-static unsigned long atalk_sum_partial(const unsigned char *data,
-				       int len, unsigned long sum)
-{
-	/* This ought to be unwrapped neatly. I'll trust gcc for now */
-	while (len--) {
-		sum += *data++;
-		sum = rol16(sum, 1);
-	}
-	return sum;
-}
-
-/*  Checksum skb data --  similar to skb_checksum  */
-static unsigned long atalk_sum_skb(const struct sk_buff *skb, int offset,
-				   int len, unsigned long sum)
-{
-	int start = skb_headlen(skb);
-	struct sk_buff *frag_iter;
-	int i, copy;
-
-	/* checksum stuff in header space */
-	if ((copy = start - offset) > 0) {
-		if (copy > len)
-			copy = len;
-		sum = atalk_sum_partial(skb->data + offset, copy, sum);
-		if ((len -= copy) == 0)
-			return sum;
-
-		offset += copy;
-	}
-
-	/* checksum stuff in frags */
-	for (i = 0; i < skb_shinfo(skb)->nr_frags; i++) {
-		int end;
-		const skb_frag_t *frag = &skb_shinfo(skb)->frags[i];
-		WARN_ON(start > offset + len);
-
-		end = start + skb_frag_size(frag);
-		if ((copy = end - offset) > 0) {
-			u8 *vaddr;
-
-			if (copy > len)
-				copy = len;
-			vaddr = kmap_atomic(skb_frag_page(frag));
-			sum = atalk_sum_partial(vaddr + skb_frag_off(frag) +
-						offset - start, copy, sum);
-			kunmap_atomic(vaddr);
-
-			if (!(len -= copy))
-				return sum;
-			offset += copy;
-		}
-		start = end;
-	}
-
-	skb_walk_frags(skb, frag_iter) {
-		int end;
-
-		WARN_ON(start > offset + len);
-
-		end = start + frag_iter->len;
-		if ((copy = end - offset) > 0) {
-			if (copy > len)
-				copy = len;
-			sum = atalk_sum_skb(frag_iter, offset - start,
-					    copy, sum);
-			if ((len -= copy) == 0)
-				return sum;
-			offset += copy;
-		}
-		start = end;
-	}
-
-	BUG_ON(len > 0);
-
-	return sum;
-}
-
-static __be16 atalk_checksum(const struct sk_buff *skb, int len)
-{
-	unsigned long sum;
-
-	/* skip header 4 bytes */
-	sum = atalk_sum_skb(skb, 4, len-4, 0);
-
-	/* Use 0xFFFF for 0. 0 itself means none */
-	return sum ? htons((unsigned short)sum) : htons(0xFFFF);
-}
-
-static struct proto ddp_proto = {
-	.name	  = "DDP",
-	.owner	  = THIS_MODULE,
-	.obj_size = sizeof(struct atalk_sock),
-};
-
-/*
- * Create a socket. Initialise the socket, blank the addresses
- * set the state.
- */
-static int atalk_create(struct net *net, struct socket *sock, int protocol,
-			int kern)
-{
-	struct sock *sk;
-	int rc = -ESOCKTNOSUPPORT;
-
-	if (!net_eq(net, &init_net))
-		return -EAFNOSUPPORT;
-
-	/*
-	 * We permit SOCK_DGRAM and RAW is an extension. It is trivial to do
-	 * and gives you the full ELAP frame. Should be handy for CAP 8)
-	 */
-	if (sock->type != SOCK_RAW && sock->type != SOCK_DGRAM)
-		goto out;
-
-	rc = -EPERM;
-	if (sock->type == SOCK_RAW && !kern && !capable(CAP_NET_RAW))
-		goto out;
-
-	rc = -ENOMEM;
-	sk = sk_alloc(net, PF_APPLETALK, GFP_KERNEL, &ddp_proto, kern);
-	if (!sk)
-		goto out;
-	rc = 0;
-	sock->ops = &atalk_dgram_ops;
-	sock_init_data(sock, sk);
-
-	/* Checksums on by default */
-	sock_set_flag(sk, SOCK_ZAPPED);
-out:
-	return rc;
-}
-
-/* Free a socket. No work needed */
-static int atalk_release(struct socket *sock)
-{
-	struct sock *sk = sock->sk;
-
-	if (sk) {
-		sock_hold(sk);
-		lock_sock(sk);
-
-		sock_orphan(sk);
-		sock->sk = NULL;
-		atalk_destroy_socket(sk);
-
-		release_sock(sk);
-		sock_put(sk);
-	}
-	return 0;
-}
-
-/**
- * atalk_pick_and_bind_port - Pick a source port when one is not given
- * @sk: socket to insert into the tables
- * @sat: address to search for
- *
- * Pick a source port when one is not given. If we can find a suitable free
- * one, we insert the socket into the tables using it.
- *
- * This whole operation must be atomic.
- */
-static int atalk_pick_and_bind_port(struct sock *sk, struct sockaddr_at *sat)
-{
-	int retval;
-
-	write_lock_bh(&atalk_sockets_lock);
-
-	for (sat->sat_port = ATPORT_RESERVED;
-	     sat->sat_port < ATPORT_LAST;
-	     sat->sat_port++) {
-		struct sock *s;
-
-		sk_for_each(s, &atalk_sockets) {
-			struct atalk_sock *at = at_sk(s);
-
-			if (at->src_net == sat->sat_addr.s_net &&
-			    at->src_node == sat->sat_addr.s_node &&
-			    at->src_port == sat->sat_port)
-				goto try_next_port;
-		}
-
-		/* Wheee, it's free, assign and insert. */
-		__atalk_insert_socket(sk);
-		at_sk(sk)->src_port = sat->sat_port;
-		retval = 0;
-		goto out;
-
-try_next_port:;
-	}
-
-	retval = -EBUSY;
-out:
-	write_unlock_bh(&atalk_sockets_lock);
-	return retval;
-}
-
-static int atalk_autobind(struct sock *sk)
-{
-	struct atalk_sock *at = at_sk(sk);
-	struct sockaddr_at sat;
-	struct atalk_addr *ap = atalk_find_primary();
-	int n = -EADDRNOTAVAIL;
-
-	if (!ap || ap->s_net == htons(ATADDR_ANYNET))
-		goto out;
-
-	at->src_net  = sat.sat_addr.s_net  = ap->s_net;
-	at->src_node = sat.sat_addr.s_node = ap->s_node;
-
-	n = atalk_pick_and_bind_port(sk, &sat);
-	if (!n)
-		sock_reset_flag(sk, SOCK_ZAPPED);
-out:
-	return n;
-}
-
-/* Set the address 'our end' of the connection */
-static int atalk_bind(struct socket *sock, struct sockaddr_unsized *uaddr, int addr_len)
-{
-	struct sockaddr_at *addr = (struct sockaddr_at *)uaddr;
-	struct sock *sk = sock->sk;
-	struct atalk_sock *at = at_sk(sk);
-	int err;
-
-	if (!sock_flag(sk, SOCK_ZAPPED) ||
-	    addr_len != sizeof(struct sockaddr_at))
-		return -EINVAL;
-
-	if (addr->sat_family != AF_APPLETALK)
-		return -EAFNOSUPPORT;
-
-	lock_sock(sk);
-	if (addr->sat_addr.s_net == htons(ATADDR_ANYNET)) {
-		struct atalk_addr *ap = atalk_find_primary();
-
-		err = -EADDRNOTAVAIL;
-		if (!ap)
-			goto out;
-
-		at->src_net  = addr->sat_addr.s_net = ap->s_net;
-		at->src_node = addr->sat_addr.s_node = ap->s_node;
-	} else {
-		err = -EADDRNOTAVAIL;
-		if (!atalk_find_interface(addr->sat_addr.s_net,
-					  addr->sat_addr.s_node))
-			goto out;
-
-		at->src_net  = addr->sat_addr.s_net;
-		at->src_node = addr->sat_addr.s_node;
-	}
-
-	if (addr->sat_port == ATADDR_ANYPORT) {
-		err = atalk_pick_and_bind_port(sk, addr);
-
-		if (err < 0)
-			goto out;
-	} else {
-		at->src_port = addr->sat_port;
-
-		err = -EADDRINUSE;
-		if (atalk_find_or_insert_socket(sk, addr))
-			goto out;
-	}
-
-	sock_reset_flag(sk, SOCK_ZAPPED);
-	err = 0;
-out:
-	release_sock(sk);
-	return err;
-}
-
-/* Set the address we talk to */
-static int atalk_connect(struct socket *sock, struct sockaddr_unsized *uaddr,
-			 int addr_len, int flags)
-{
-	struct sock *sk = sock->sk;
-	struct atalk_sock *at = at_sk(sk);
-	struct sockaddr_at *addr;
-	int err;
-
-	sk->sk_state   = TCP_CLOSE;
-	sock->state = SS_UNCONNECTED;
-
-	if (addr_len != sizeof(*addr))
-		return -EINVAL;
-
-	addr = (struct sockaddr_at *)uaddr;
-
-	if (addr->sat_family != AF_APPLETALK)
-		return -EAFNOSUPPORT;
-
-	if (addr->sat_addr.s_node == ATADDR_BCAST &&
-	    !sock_flag(sk, SOCK_BROADCAST)) {
-#if 1
-		pr_warn("atalk_connect: %s is broken and did not set SO_BROADCAST.\n",
-			current->comm);
-#else
-		return -EACCES;
-#endif
-	}
-
-	lock_sock(sk);
-	err = -EBUSY;
-	if (sock_flag(sk, SOCK_ZAPPED))
-		if (atalk_autobind(sk) < 0)
-			goto out;
-
-	err = -ENETUNREACH;
-	if (!atrtr_get_dev(&addr->sat_addr))
-		goto out;
-
-	at->dest_port = addr->sat_port;
-	at->dest_net  = addr->sat_addr.s_net;
-	at->dest_node = addr->sat_addr.s_node;
-
-	sock->state  = SS_CONNECTED;
-	sk->sk_state = TCP_ESTABLISHED;
-	err = 0;
-out:
-	release_sock(sk);
-	return err;
-}
-
-/*
- * Find the name of an AppleTalk socket. Just copy the right
- * fields into the sockaddr.
- */
-static int atalk_getname(struct socket *sock, struct sockaddr *uaddr,
-			 int peer)
-{
-	struct sockaddr_at sat;
-	struct sock *sk = sock->sk;
-	struct atalk_sock *at = at_sk(sk);
-	int err;
-
-	lock_sock(sk);
-	err = -ENOBUFS;
-	if (sock_flag(sk, SOCK_ZAPPED))
-		if (atalk_autobind(sk) < 0)
-			goto out;
-
-	memset(&sat, 0, sizeof(sat));
-
-	if (peer) {
-		err = -ENOTCONN;
-		if (sk->sk_state != TCP_ESTABLISHED)
-			goto out;
-
-		sat.sat_addr.s_net  = at->dest_net;
-		sat.sat_addr.s_node = at->dest_node;
-		sat.sat_port	    = at->dest_port;
-	} else {
-		sat.sat_addr.s_net  = at->src_net;
-		sat.sat_addr.s_node = at->src_node;
-		sat.sat_port	    = at->src_port;
-	}
-
-	sat.sat_family = AF_APPLETALK;
-	memcpy(uaddr, &sat, sizeof(sat));
-	err = sizeof(struct sockaddr_at);
-
-out:
-	release_sock(sk);
-	return err;
-}
-
-static int atalk_route_packet(struct sk_buff *skb, struct net_device *dev,
-			      struct ddpehdr *ddp, __u16 len_hops, int origlen)
-{
-	struct atalk_route *rt;
-	struct atalk_addr ta;
-
-	/*
-	 * Don't route multicast, etc., packets, or packets sent to "this
-	 * network"
-	 */
-	if (skb->pkt_type != PACKET_HOST || !ddp->deh_dnet) {
-		/*
-		 * FIXME:
-		 *
-		 * Can it ever happen that a packet is from a PPP iface and
-		 * needs to be broadcast onto the default network?
-		 */
-		if (dev->type == ARPHRD_PPP)
-			printk(KERN_DEBUG "AppleTalk: didn't forward broadcast "
-					  "packet received from PPP iface\n");
-		goto free_it;
-	}
-
-	ta.s_net  = ddp->deh_dnet;
-	ta.s_node = ddp->deh_dnode;
-
-	/* Route the packet */
-	rt = atrtr_find(&ta);
-	/* increment hops count */
-	len_hops += 1 << 10;
-	if (!rt || !(len_hops & (15 << 10)))
-		goto free_it;
-
-	/* FIXME: use skb->cb to be able to use shared skbs */
-
-	/*
-	 * Route goes through another gateway, so set the target to the
-	 * gateway instead.
-	 */
-
-	if (rt->flags & RTF_GATEWAY) {
-		ta.s_net  = rt->gateway.s_net;
-		ta.s_node = rt->gateway.s_node;
-	}
-
-	/* Fix up skb->len field */
-	skb_trim(skb, min_t(unsigned int, origlen,
-			    (rt->dev->hard_header_len +
-			     ddp_dl->header_length + (len_hops & 1023))));
-
-	/* FIXME: use skb->cb to be able to use shared skbs */
-	ddp->deh_len_hops = htons(len_hops);
-
-	/*
-	 * Send the buffer onwards
-	 *
-	 * Now we must always be careful. If it's come from LocalTalk to
-	 * EtherTalk it might not fit
-	 *
-	 * Order matters here: If a packet has to be copied to make a new
-	 * headroom (rare hopefully) then it won't need unsharing.
-	 *
-	 * Note. ddp-> becomes invalid at the realloc.
-	 */
-	if (skb_headroom(skb) < 22) {
-		/* 22 bytes - 12 ether, 2 len, 3 802.2 5 snap */
-		struct sk_buff *nskb = skb_realloc_headroom(skb, 32);
-		kfree_skb(skb);
-		skb = nskb;
-	} else
-		skb = skb_unshare(skb, GFP_ATOMIC);
-
-	/*
-	 * If the buffer didn't vanish into the lack of space bitbucket we can
-	 * send it.
-	 */
-	if (skb == NULL)
-		goto drop;
-
-	if (aarp_send_ddp(rt->dev, skb, &ta, NULL) == NET_XMIT_DROP)
-		return NET_RX_DROP;
-	return NET_RX_SUCCESS;
-free_it:
-	kfree_skb(skb);
-drop:
-	return NET_RX_DROP;
-}
-
-/**
- *	atalk_rcv - Receive a packet (in skb) from device dev
- *	@skb: packet received
- *	@dev: network device where the packet comes from
- *	@pt: packet type
- *	@orig_dev: the original receive net device
- *
- *	Receive a packet (in skb) from device dev. This has come from the SNAP
- *	decoder, and on entry skb->transport_header is the DDP header, skb->len
- *	is the DDP header, skb->len is the DDP length. The physical headers
- *	have been extracted. PPP should probably pass frames marked as for this
- *	layer.  [ie ARPHRD_ETHERTALK]
- */
-static int atalk_rcv(struct sk_buff *skb, struct net_device *dev,
-		     struct packet_type *pt, struct net_device *orig_dev)
-{
-	struct ddpehdr *ddp;
-	struct sock *sock;
-	struct atalk_iface *atif;
-	struct sockaddr_at tosat;
-	int origlen;
-	__u16 len_hops;
-
-	if (!net_eq(dev_net(dev), &init_net))
-		goto drop;
-
-	/* Don't mangle buffer if shared */
-	if (!(skb = skb_share_check(skb, GFP_ATOMIC)))
-		goto out;
-
-	/* Size check and make sure header is contiguous */
-	if (!pskb_may_pull(skb, sizeof(*ddp)))
-		goto drop;
-
-	ddp = ddp_hdr(skb);
-
-	len_hops = ntohs(ddp->deh_len_hops);
-
-	/* Trim buffer in case of stray trailing data */
-	origlen = skb->len;
-	skb_trim(skb, min_t(unsigned int, skb->len, len_hops & 1023));
-
-	/*
-	 * Size check to see if ddp->deh_len was crap
-	 * (Otherwise we'll detonate most spectacularly
-	 * in the middle of atalk_checksum() or recvmsg()).
-	 */
-	if (skb->len < sizeof(*ddp) || skb->len < (len_hops & 1023)) {
-		pr_debug("AppleTalk: dropping corrupted frame (deh_len=%u, "
-			 "skb->len=%u)\n", len_hops & 1023, skb->len);
-		goto drop;
-	}
-
-	/*
-	 * Any checksums. Note we don't do htons() on this == is assumed to be
-	 * valid for net byte orders all over the networking code...
-	 */
-	if (ddp->deh_sum &&
-	    atalk_checksum(skb, len_hops & 1023) != ddp->deh_sum)
-		/* Not a valid AppleTalk frame - dustbin time */
-		goto drop;
-
-	/* Check the packet is aimed at us */
-	if (!ddp->deh_dnet)	/* Net 0 is 'this network' */
-		atif = atalk_find_anynet(ddp->deh_dnode, dev);
-	else
-		atif = atalk_find_interface(ddp->deh_dnet, ddp->deh_dnode);
-
-	if (!atif) {
-		/* Not ours, so we route the packet via the correct
-		 * AppleTalk iface
-		 */
-		return atalk_route_packet(skb, dev, ddp, len_hops, origlen);
-	}
-
-	/*
-	 * Which socket - atalk_search_socket() looks for a *full match*
-	 * of the <net, node, port> tuple.
-	 */
-	tosat.sat_addr.s_net  = ddp->deh_dnet;
-	tosat.sat_addr.s_node = ddp->deh_dnode;
-	tosat.sat_port	      = ddp->deh_dport;
-
-	sock = atalk_search_socket(&tosat, atif);
-	if (!sock) /* But not one of our sockets */
-		goto drop;
-
-	/* Queue packet (standard) */
-	if (sock_queue_rcv_skb(sock, skb) < 0)
-		goto drop;
-
-	return NET_RX_SUCCESS;
-
-drop:
-	kfree_skb(skb);
-out:
-	return NET_RX_DROP;
-
-}
-
-/*
- * Receive a LocalTalk frame. We make some demands on the caller here.
- * Caller must provide enough headroom on the packet to pull the short
- * header and append a long one.
- */
-static int ltalk_rcv(struct sk_buff *skb, struct net_device *dev,
-		     struct packet_type *pt, struct net_device *orig_dev)
-{
-	if (!net_eq(dev_net(dev), &init_net))
-		goto freeit;
-
-	/* Expand any short form frames */
-	if (skb_mac_header(skb)[2] == 1) {
-		struct ddpehdr *ddp;
-		/* Find our address */
-		struct atalk_addr *ap = atalk_find_dev_addr(dev);
-
-		if (!ap || skb->len < sizeof(__be16) || skb->len > 1023)
-			goto freeit;
-
-		/* Don't mangle buffer if shared */
-		if (!(skb = skb_share_check(skb, GFP_ATOMIC)))
-			return 0;
-
-		/*
-		 * The push leaves us with a ddephdr not an shdr, and
-		 * handily the port bytes in the right place preset.
-		 */
-		ddp = skb_push(skb, sizeof(*ddp) - 4);
-
-		/* Now fill in the long header */
-
-		/*
-		 * These two first. The mac overlays the new source/dest
-		 * network information so we MUST copy these before
-		 * we write the network numbers !
-		 */
-
-		ddp->deh_dnode = skb_mac_header(skb)[0];     /* From physical header */
-		ddp->deh_snode = skb_mac_header(skb)[1];     /* From physical header */
-
-		ddp->deh_dnet  = ap->s_net;	/* Network number */
-		ddp->deh_snet  = ap->s_net;
-		ddp->deh_sum   = 0;		/* No checksum */
-		/*
-		 * Not sure about this bit...
-		 */
-		/* Non routable, so force a drop if we slip up later */
-		ddp->deh_len_hops = htons(skb->len + (DDP_MAXHOPS << 10));
-	}
-	skb_reset_transport_header(skb);
-
-	return atalk_rcv(skb, dev, pt, orig_dev);
-freeit:
-	kfree_skb(skb);
-	return 0;
-}
-
-static int atalk_sendmsg(struct socket *sock, struct msghdr *msg, size_t len)
-{
-	struct sock *sk = sock->sk;
-	struct atalk_sock *at = at_sk(sk);
-	DECLARE_SOCKADDR(struct sockaddr_at *, usat, msg->msg_name);
-	int flags = msg->msg_flags;
-	int loopback = 0;
-	struct sockaddr_at local_satalk, gsat;
-	struct sk_buff *skb;
-	struct net_device *dev;
-	struct ddpehdr *ddp;
-	int size, hard_header_len;
-	struct atalk_route *rt, *rt_lo = NULL;
-	int err;
-
-	if (flags & ~(MSG_DONTWAIT|MSG_CMSG_COMPAT))
-		return -EINVAL;
-
-	if (len > DDP_MAXSZ)
-		return -EMSGSIZE;
-
-	lock_sock(sk);
-	if (usat) {
-		err = -EBUSY;
-		if (sock_flag(sk, SOCK_ZAPPED))
-			if (atalk_autobind(sk) < 0)
-				goto out;
-
-		err = -EINVAL;
-		if (msg->msg_namelen < sizeof(*usat) ||
-		    usat->sat_family != AF_APPLETALK)
-			goto out;
-
-		err = -EPERM;
-		/* netatalk didn't implement this check */
-		if (usat->sat_addr.s_node == ATADDR_BCAST &&
-		    !sock_flag(sk, SOCK_BROADCAST)) {
-			goto out;
-		}
-	} else {
-		err = -ENOTCONN;
-		if (sk->sk_state != TCP_ESTABLISHED)
-			goto out;
-		usat = &local_satalk;
-		usat->sat_family      = AF_APPLETALK;
-		usat->sat_port	      = at->dest_port;
-		usat->sat_addr.s_node = at->dest_node;
-		usat->sat_addr.s_net  = at->dest_net;
-	}
-
-	/* Build a packet */
-	net_dbg_ratelimited("SK %p: Got address.\n", sk);
-
-	/* For headers */
-	size = sizeof(struct ddpehdr) + len + ddp_dl->header_length;
-
-	if (usat->sat_addr.s_net || usat->sat_addr.s_node == ATADDR_ANYNODE) {
-		rt = atrtr_find(&usat->sat_addr);
-	} else {
-		struct atalk_addr at_hint;
-
-		at_hint.s_node = 0;
-		at_hint.s_net  = at->src_net;
-
-		rt = atrtr_find(&at_hint);
-	}
-	err = -ENETUNREACH;
-	if (!rt)
-		goto out;
-
-	dev = rt->dev;
-
-	net_dbg_ratelimited("SK %p: Size needed %d, device %s\n",
-			sk, size, dev->name);
-
-	hard_header_len = dev->hard_header_len;
-	/* Leave room for loopback hardware header if necessary */
-	if (usat->sat_addr.s_node == ATADDR_BCAST &&
-	    (dev->flags & IFF_LOOPBACK || !(rt->flags & RTF_GATEWAY))) {
-		struct atalk_addr at_lo;
-
-		at_lo.s_node = 0;
-		at_lo.s_net  = 0;
-
-		rt_lo = atrtr_find(&at_lo);
-
-		if (rt_lo && rt_lo->dev->hard_header_len > hard_header_len)
-			hard_header_len = rt_lo->dev->hard_header_len;
-	}
-
-	size += hard_header_len;
-	release_sock(sk);
-	skb = sock_alloc_send_skb(sk, size, (flags & MSG_DONTWAIT), &err);
-	lock_sock(sk);
-	if (!skb)
-		goto out;
-
-	skb_reserve(skb, ddp_dl->header_length);
-	skb_reserve(skb, hard_header_len);
-	skb->dev = dev;
-
-	net_dbg_ratelimited("SK %p: Begin build.\n", sk);
-
-	ddp = skb_put(skb, sizeof(struct ddpehdr));
-	ddp->deh_len_hops  = htons(len + sizeof(*ddp));
-	ddp->deh_dnet  = usat->sat_addr.s_net;
-	ddp->deh_snet  = at->src_net;
-	ddp->deh_dnode = usat->sat_addr.s_node;
-	ddp->deh_snode = at->src_node;
-	ddp->deh_dport = usat->sat_port;
-	ddp->deh_sport = at->src_port;
-
-	net_dbg_ratelimited("SK %p: Copy user data (%zd bytes).\n", sk, len);
-
-	err = memcpy_from_msg(skb_put(skb, len), msg, len);
-	if (err) {
-		kfree_skb(skb);
-		err = -EFAULT;
-		goto out;
-	}
-
-	if (sk->sk_no_check_tx)
-		ddp->deh_sum = 0;
-	else
-		ddp->deh_sum = atalk_checksum(skb, len + sizeof(*ddp));
-
-	/*
-	 * Loopback broadcast packets to non gateway targets (ie routes
-	 * to group we are in)
-	 */
-	if (ddp->deh_dnode == ATADDR_BCAST &&
-	    !(rt->flags & RTF_GATEWAY) && !(dev->flags & IFF_LOOPBACK)) {
-		struct sk_buff *skb2 = skb_copy(skb, GFP_KERNEL);
-
-		if (skb2) {
-			loopback = 1;
-			net_dbg_ratelimited("SK %p: send out(copy).\n", sk);
-			/*
-			 * If it fails it is queued/sent above in the aarp queue
-			 */
-			aarp_send_ddp(dev, skb2, &usat->sat_addr, NULL);
-		}
-	}
-
-	if (dev->flags & IFF_LOOPBACK || loopback) {
-		net_dbg_ratelimited("SK %p: Loop back.\n", sk);
-		/* loop back */
-		skb_orphan(skb);
-		if (ddp->deh_dnode == ATADDR_BCAST) {
-			if (!rt_lo) {
-				kfree_skb(skb);
-				err = -ENETUNREACH;
-				goto out;
-			}
-			dev = rt_lo->dev;
-			skb->dev = dev;
-		}
-		ddp_dl->request(ddp_dl, skb, dev->dev_addr);
-	} else {
-		net_dbg_ratelimited("SK %p: send out.\n", sk);
-		if (rt->flags & RTF_GATEWAY) {
-		    gsat.sat_addr = rt->gateway;
-		    usat = &gsat;
-		}
-
-		/*
-		 * If it fails it is queued/sent above in the aarp queue
-		 */
-		aarp_send_ddp(dev, skb, &usat->sat_addr, NULL);
-	}
-	net_dbg_ratelimited("SK %p: Done write (%zd).\n", sk, len);
-
-out:
-	release_sock(sk);
-	return err ? : len;
-}
-
-static int atalk_recvmsg(struct socket *sock, struct msghdr *msg, size_t size,
-			 int flags)
-{
-	struct sock *sk = sock->sk;
-	struct ddpehdr *ddp;
-	int copied = 0;
-	int offset = 0;
-	int err = 0;
-	struct sk_buff *skb;
-
-	skb = skb_recv_datagram(sk, flags, &err);
-	lock_sock(sk);
-
-	if (!skb)
-		goto out;
-
-	/* FIXME: use skb->cb to be able to use shared skbs */
-	ddp = ddp_hdr(skb);
-	copied = ntohs(ddp->deh_len_hops) & 1023;
-
-	if (sk->sk_type != SOCK_RAW) {
-		offset = sizeof(*ddp);
-		copied -= offset;
-	}
-
-	if (copied > size) {
-		copied = size;
-		msg->msg_flags |= MSG_TRUNC;
-	}
-	err = skb_copy_datagram_msg(skb, offset, msg, copied);
-
-	if (!err && msg->msg_name) {
-		DECLARE_SOCKADDR(struct sockaddr_at *, sat, msg->msg_name);
-		sat->sat_family      = AF_APPLETALK;
-		sat->sat_port        = ddp->deh_sport;
-		sat->sat_addr.s_node = ddp->deh_snode;
-		sat->sat_addr.s_net  = ddp->deh_snet;
-		msg->msg_namelen     = sizeof(*sat);
-	}
-
-	skb_free_datagram(sk, skb);	/* Free the datagram. */
-
-out:
-	release_sock(sk);
-	return err ? : copied;
-}
-
-
-/*
- * AppleTalk ioctl calls.
- */
-static int atalk_ioctl(struct socket *sock, unsigned int cmd, unsigned long arg)
-{
-	int rc = -ENOIOCTLCMD;
-	struct sock *sk = sock->sk;
-	void __user *argp = (void __user *)arg;
-
-	switch (cmd) {
-	/* Protocol layer */
-	case TIOCOUTQ: {
-		long amount = sk->sk_sndbuf - sk_wmem_alloc_get(sk);
-
-		if (amount < 0)
-			amount = 0;
-		rc = put_user(amount, (int __user *)argp);
-		break;
-	}
-	case TIOCINQ: {
-		struct sk_buff *skb;
-		long amount = 0;
-
-		spin_lock_irq(&sk->sk_receive_queue.lock);
-		skb = skb_peek(&sk->sk_receive_queue);
-		if (skb)
-			amount = skb->len - sizeof(struct ddpehdr);
-		spin_unlock_irq(&sk->sk_receive_queue.lock);
-		rc = put_user(amount, (int __user *)argp);
-		break;
-	}
-	/* Routing */
-	case SIOCADDRT:
-	case SIOCDELRT:
-		rc = -EPERM;
-		if (capable(CAP_NET_ADMIN))
-			rc = atrtr_ioctl(cmd, argp);
-		break;
-	/* Interface */
-	case SIOCGIFADDR:
-	case SIOCSIFADDR:
-	case SIOCGIFBRDADDR:
-	case SIOCATALKDIFADDR:
-	case SIOCDIFADDR:
-	case SIOCSARP:		/* proxy AARP */
-	case SIOCDARP:		/* proxy AARP */
-		rtnl_lock();
-		rc = atif_ioctl(cmd, argp);
-		rtnl_unlock();
-		break;
-	}
-
-	return rc;
-}
-
-
-#ifdef CONFIG_COMPAT
-static int atalk_compat_routing_ioctl(struct sock *sk, unsigned int cmd,
-		struct compat_rtentry __user *ur)
-{
-	compat_uptr_t rtdev;
-	struct rtentry rt;
-
-	if (copy_from_user(&rt.rt_dst, &ur->rt_dst,
-			3 * sizeof(struct sockaddr)) ||
-	    get_user(rt.rt_flags, &ur->rt_flags) ||
-	    get_user(rt.rt_metric, &ur->rt_metric) ||
-	    get_user(rt.rt_mtu, &ur->rt_mtu) ||
-	    get_user(rt.rt_window, &ur->rt_window) ||
-	    get_user(rt.rt_irtt, &ur->rt_irtt) ||
-	    get_user(rtdev, &ur->rt_dev))
-		return -EFAULT;
-
-	switch (cmd) {
-	case SIOCDELRT:
-		if (rt.rt_dst.sa_family != AF_APPLETALK)
-			return -EINVAL;
-		return atrtr_delete(&((struct sockaddr_at *)
-				      &rt.rt_dst)->sat_addr);
-
-	case SIOCADDRT:
-		rt.rt_dev = compat_ptr(rtdev);
-		return atrtr_ioctl_addrt(&rt);
-	default:
-		return -EINVAL;
-	}
-}
-static int atalk_compat_ioctl(struct socket *sock, unsigned int cmd, unsigned long arg)
-{
-	void __user *argp = compat_ptr(arg);
-	struct sock *sk = sock->sk;
-
-	switch (cmd) {
-	case SIOCADDRT:
-	case SIOCDELRT:
-		return atalk_compat_routing_ioctl(sk, cmd, argp);
-	/*
-	 * SIOCATALKDIFADDR is a SIOCPROTOPRIVATE ioctl number, so we
-	 * cannot handle it in common code. The data we access if ifreq
-	 * here is compatible, so we can simply call the native
-	 * handler.
-	 */
-	case SIOCATALKDIFADDR:
-		return atalk_ioctl(sock, cmd, (unsigned long)argp);
-	default:
-		return -ENOIOCTLCMD;
-	}
-}
-#endif /* CONFIG_COMPAT */
-
-
-static const struct net_proto_family atalk_family_ops = {
-	.family		= PF_APPLETALK,
-	.create		= atalk_create,
-	.owner		= THIS_MODULE,
-};
-
-static const struct proto_ops atalk_dgram_ops = {
-	.family		= PF_APPLETALK,
-	.owner		= THIS_MODULE,
-	.release	= atalk_release,
-	.bind		= atalk_bind,
-	.connect	= atalk_connect,
-	.socketpair	= sock_no_socketpair,
-	.accept		= sock_no_accept,
-	.getname	= atalk_getname,
-	.poll		= datagram_poll,
-	.ioctl		= atalk_ioctl,
-	.gettstamp	= sock_gettstamp,
-#ifdef CONFIG_COMPAT
-	.compat_ioctl	= atalk_compat_ioctl,
-#endif
-	.listen		= sock_no_listen,
-	.shutdown	= sock_no_shutdown,
-	.sendmsg	= atalk_sendmsg,
-	.recvmsg	= atalk_recvmsg,
-	.mmap		= sock_no_mmap,
-};
-
-static struct notifier_block ddp_notifier = {
-	.notifier_call	= ddp_device_event,
-};
-
-static struct packet_type ltalk_packet_type __read_mostly = {
-	.type		= cpu_to_be16(ETH_P_LOCALTALK),
-	.func		= ltalk_rcv,
-};
-
-static struct packet_type ppptalk_packet_type __read_mostly = {
-	.type		= cpu_to_be16(ETH_P_PPPTALK),
-	.func		= atalk_rcv,
-};
-
-static unsigned char ddp_snap_id[] = { 0x08, 0x00, 0x07, 0x80, 0x9B };
-
-/* Export symbols for use by drivers when AppleTalk is a module */
-EXPORT_SYMBOL(atrtr_get_dev);
-EXPORT_SYMBOL(atalk_find_dev_addr);
-
-/* Called by proto.c on kernel start up */
-static int __init atalk_init(void)
-{
-	int rc;
-
-	rc = proto_register(&ddp_proto, 0);
-	if (rc)
-		goto out;
-
-	rc = sock_register(&atalk_family_ops);
-	if (rc)
-		goto out_proto;
-
-	ddp_dl = register_snap_client(ddp_snap_id, atalk_rcv);
-	if (!ddp_dl) {
-		pr_crit("Unable to register DDP with SNAP.\n");
-		rc = -ENOMEM;
-		goto out_sock;
-	}
-
-	dev_add_pack(&ltalk_packet_type);
-	dev_add_pack(&ppptalk_packet_type);
-
-	rc = register_netdevice_notifier(&ddp_notifier);
-	if (rc)
-		goto out_snap;
-
-	rc = aarp_proto_init();
-	if (rc)
-		goto out_dev;
-
-	rc = atalk_proc_init();
-	if (rc)
-		goto out_aarp;
-
-	rc = atalk_register_sysctl();
-	if (rc)
-		goto out_proc;
-out:
-	return rc;
-out_proc:
-	atalk_proc_exit();
-out_aarp:
-	aarp_cleanup_module();
-out_dev:
-	unregister_netdevice_notifier(&ddp_notifier);
-out_snap:
-	dev_remove_pack(&ppptalk_packet_type);
-	dev_remove_pack(&ltalk_packet_type);
-	unregister_snap_client(ddp_dl);
-out_sock:
-	sock_unregister(PF_APPLETALK);
-out_proto:
-	proto_unregister(&ddp_proto);
-	goto out;
-}
-module_init(atalk_init);
-
-/*
- * No explicit module reference count manipulation is needed in the
- * protocol. Socket layer sets module reference count for us
- * and interfaces reference counting is done
- * by the network device layer.
- *
- * Ergo, before the AppleTalk module can be removed, all AppleTalk
- * sockets should be closed from user space.
- */
-static void __exit atalk_exit(void)
-{
-#ifdef CONFIG_SYSCTL
-	atalk_unregister_sysctl();
-#endif /* CONFIG_SYSCTL */
-	atalk_proc_exit();
-	aarp_cleanup_module();	/* General aarp clean-up. */
-	unregister_netdevice_notifier(&ddp_notifier);
-	dev_remove_pack(&ltalk_packet_type);
-	dev_remove_pack(&ppptalk_packet_type);
-	unregister_snap_client(ddp_dl);
-	sock_unregister(PF_APPLETALK);
-	proto_unregister(&ddp_proto);
-}
-module_exit(atalk_exit);
-
-MODULE_LICENSE("GPL");
-MODULE_AUTHOR("Alan Cox <alan@lxorguk.ukuu.org.uk>");
-MODULE_DESCRIPTION("AppleTalk 0.20\n");
-MODULE_ALIAS_NETPROTO(PF_APPLETALK);
diff --git a/net/appletalk/sysctl_net_atalk.c b/net/appletalk/sysctl_net_atalk.c
deleted file mode 100644
index 7aebfe903242..000000000000
--- a/net/appletalk/sysctl_net_atalk.c
+++ /dev/null
@@ -1,58 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * sysctl_net_atalk.c: sysctl interface to net AppleTalk subsystem.
- *
- * Begun April 1, 1996, Mike Shaver.
- * Added /proc/sys/net/atalk directory entry (empty =) ). [MS]
- * Dynamic registration, added aarp entries. (5/30/97 Chris Horn)
- */
-
-#include <linux/sysctl.h>
-#include <net/sock.h>
-#include <linux/atalk.h>
-
-static struct ctl_table atalk_table[] = {
-	{
-		.procname	= "aarp-expiry-time",
-		.data		= &sysctl_aarp_expiry_time,
-		.maxlen		= sizeof(int),
-		.mode		= 0644,
-		.proc_handler	= proc_dointvec_jiffies,
-	},
-	{
-		.procname	= "aarp-tick-time",
-		.data		= &sysctl_aarp_tick_time,
-		.maxlen		= sizeof(int),
-		.mode		= 0644,
-		.proc_handler	= proc_dointvec_jiffies,
-	},
-	{
-		.procname	= "aarp-retransmit-limit",
-		.data		= &sysctl_aarp_retransmit_limit,
-		.maxlen		= sizeof(int),
-		.mode		= 0644,
-		.proc_handler	= proc_dointvec,
-	},
-	{
-		.procname	= "aarp-resolve-time",
-		.data		= &sysctl_aarp_resolve_time,
-		.maxlen		= sizeof(int),
-		.mode		= 0644,
-		.proc_handler	= proc_dointvec_jiffies,
-	},
-};
-
-static struct ctl_table_header *atalk_table_header;
-
-int __init atalk_register_sysctl(void)
-{
-	atalk_table_header = register_net_sysctl(&init_net, "net/appletalk", atalk_table);
-	if (!atalk_table_header)
-		return -ENOMEM;
-	return 0;
-}
-
-void atalk_unregister_sysctl(void)
-{
-	unregister_net_sysctl_table(atalk_table_header);
-}
diff --git a/arch/arm/configs/ixp4xx_defconfig b/arch/arm/configs/ixp4xx_defconfig
index 01d72580bcc5..418ef909572b 100644
--- a/arch/arm/configs/ixp4xx_defconfig
+++ b/arch/arm/configs/ixp4xx_defconfig
@@ -55,7 +55,6 @@ CONFIG_ATM=y
 CONFIG_ATM_BR2684=m
 CONFIG_BRIDGE=m
 CONFIG_VLAN_8021Q=m
-CONFIG_ATALK=m
 CONFIG_DEV_APPLETALK=m
 CONFIG_IPDDP=m
 CONFIG_IPDDP_ENCAP=y
diff --git a/arch/m68k/configs/amiga_defconfig b/arch/m68k/configs/amiga_defconfig
index aadff466830f..93b1cb632b19 100644
--- a/arch/m68k/configs/amiga_defconfig
+++ b/arch/m68k/configs/amiga_defconfig
@@ -236,7 +236,6 @@ CONFIG_RDS=m
 CONFIG_RDS_TCP=m
 CONFIG_L2TP=m
 CONFIG_BRIDGE=m
-CONFIG_ATALK=m
 CONFIG_DNS_RESOLVER=y
 CONFIG_BATMAN_ADV=m
 # CONFIG_BATMAN_ADV_BATMAN_V is not set
diff --git a/arch/m68k/configs/apollo_defconfig b/arch/m68k/configs/apollo_defconfig
index ea9487a39884..6edfa55c8b9f 100644
--- a/arch/m68k/configs/apollo_defconfig
+++ b/arch/m68k/configs/apollo_defconfig
@@ -232,7 +232,6 @@ CONFIG_RDS=m
 CONFIG_RDS_TCP=m
 CONFIG_L2TP=m
 CONFIG_BRIDGE=m
-CONFIG_ATALK=m
 CONFIG_DNS_RESOLVER=y
 CONFIG_BATMAN_ADV=m
 # CONFIG_BATMAN_ADV_BATMAN_V is not set
diff --git a/arch/m68k/configs/atari_defconfig b/arch/m68k/configs/atari_defconfig
index a70127ac7a2d..f8808aac9e63 100644
--- a/arch/m68k/configs/atari_defconfig
+++ b/arch/m68k/configs/atari_defconfig
@@ -239,7 +239,6 @@ CONFIG_RDS=m
 CONFIG_RDS_TCP=m
 CONFIG_L2TP=m
 CONFIG_BRIDGE=m
-CONFIG_ATALK=m
 CONFIG_DNS_RESOLVER=y
 CONFIG_BATMAN_ADV=m
 # CONFIG_BATMAN_ADV_BATMAN_V is not set
diff --git a/arch/m68k/configs/bvme6000_defconfig b/arch/m68k/configs/bvme6000_defconfig
index 83da79382538..067ecf850201 100644
--- a/arch/m68k/configs/bvme6000_defconfig
+++ b/arch/m68k/configs/bvme6000_defconfig
@@ -229,7 +229,6 @@ CONFIG_RDS=m
 CONFIG_RDS_TCP=m
 CONFIG_L2TP=m
 CONFIG_BRIDGE=m
-CONFIG_ATALK=m
 CONFIG_DNS_RESOLVER=y
 CONFIG_BATMAN_ADV=m
 # CONFIG_BATMAN_ADV_BATMAN_V is not set
diff --git a/arch/m68k/configs/hp300_defconfig b/arch/m68k/configs/hp300_defconfig
index cea5ab74b3b1..aa93c67caa43 100644
--- a/arch/m68k/configs/hp300_defconfig
+++ b/arch/m68k/configs/hp300_defconfig
@@ -231,7 +231,6 @@ CONFIG_RDS=m
 CONFIG_RDS_TCP=m
 CONFIG_L2TP=m
 CONFIG_BRIDGE=m
-CONFIG_ATALK=m
 CONFIG_DNS_RESOLVER=y
 CONFIG_BATMAN_ADV=m
 # CONFIG_BATMAN_ADV_BATMAN_V is not set
diff --git a/arch/m68k/configs/mac_defconfig b/arch/m68k/configs/mac_defconfig
index 26406777376d..79d2e0383484 100644
--- a/arch/m68k/configs/mac_defconfig
+++ b/arch/m68k/configs/mac_defconfig
@@ -230,7 +230,6 @@ CONFIG_RDS=m
 CONFIG_RDS_TCP=m
 CONFIG_L2TP=m
 CONFIG_BRIDGE=m
-CONFIG_ATALK=m
 CONFIG_DNS_RESOLVER=y
 CONFIG_BATMAN_ADV=m
 # CONFIG_BATMAN_ADV_BATMAN_V is not set
diff --git a/arch/m68k/configs/multi_defconfig b/arch/m68k/configs/multi_defconfig
index 8357491645ad..b13889268ff5 100644
--- a/arch/m68k/configs/multi_defconfig
+++ b/arch/m68k/configs/multi_defconfig
@@ -250,7 +250,6 @@ CONFIG_RDS=m
 CONFIG_RDS_TCP=m
 CONFIG_L2TP=m
 CONFIG_BRIDGE=m
-CONFIG_ATALK=m
 CONFIG_DNS_RESOLVER=y
 CONFIG_BATMAN_ADV=m
 # CONFIG_BATMAN_ADV_BATMAN_V is not set
diff --git a/arch/m68k/configs/mvme147_defconfig b/arch/m68k/configs/mvme147_defconfig
index fe94f95862e7..cd773d2509bb 100644
--- a/arch/m68k/configs/mvme147_defconfig
+++ b/arch/m68k/configs/mvme147_defconfig
@@ -228,7 +228,6 @@ CONFIG_RDS=m
 CONFIG_RDS_TCP=m
 CONFIG_L2TP=m
 CONFIG_BRIDGE=m
-CONFIG_ATALK=m
 CONFIG_DNS_RESOLVER=y
 CONFIG_BATMAN_ADV=m
 # CONFIG_BATMAN_ADV_BATMAN_V is not set
diff --git a/arch/m68k/configs/mvme16x_defconfig b/arch/m68k/configs/mvme16x_defconfig
index ba67cacc079e..af921f24a5c8 100644
--- a/arch/m68k/configs/mvme16x_defconfig
+++ b/arch/m68k/configs/mvme16x_defconfig
@@ -229,7 +229,6 @@ CONFIG_RDS=m
 CONFIG_RDS_TCP=m
 CONFIG_L2TP=m
 CONFIG_BRIDGE=m
-CONFIG_ATALK=m
 CONFIG_DNS_RESOLVER=y
 CONFIG_BATMAN_ADV=m
 # CONFIG_BATMAN_ADV_BATMAN_V is not set
diff --git a/arch/m68k/configs/q40_defconfig b/arch/m68k/configs/q40_defconfig
index 552399979e4b..f2eb67618e97 100644
--- a/arch/m68k/configs/q40_defconfig
+++ b/arch/m68k/configs/q40_defconfig
@@ -230,7 +230,6 @@ CONFIG_RDS=m
 CONFIG_RDS_TCP=m
 CONFIG_L2TP=m
 CONFIG_BRIDGE=m
-CONFIG_ATALK=m
 CONFIG_DNS_RESOLVER=y
 CONFIG_BATMAN_ADV=m
 # CONFIG_BATMAN_ADV_BATMAN_V is not set
diff --git a/arch/m68k/configs/sun3_defconfig b/arch/m68k/configs/sun3_defconfig
index b4f3935d3d18..108dac7ed55e 100644
--- a/arch/m68k/configs/sun3_defconfig
+++ b/arch/m68k/configs/sun3_defconfig
@@ -225,7 +225,6 @@ CONFIG_RDS=m
 CONFIG_RDS_TCP=m
 CONFIG_L2TP=m
 CONFIG_BRIDGE=m
-CONFIG_ATALK=m
 CONFIG_DNS_RESOLVER=y
 CONFIG_BATMAN_ADV=m
 # CONFIG_BATMAN_ADV_BATMAN_V is not set
diff --git a/arch/m68k/configs/sun3x_defconfig b/arch/m68k/configs/sun3x_defconfig
index bb519520ae6e..1e1d946cbe23 100644
--- a/arch/m68k/configs/sun3x_defconfig
+++ b/arch/m68k/configs/sun3x_defconfig
@@ -226,7 +226,6 @@ CONFIG_RDS=m
 CONFIG_RDS_TCP=m
 CONFIG_L2TP=m
 CONFIG_BRIDGE=m
-CONFIG_ATALK=m
 CONFIG_DNS_RESOLVER=y
 CONFIG_BATMAN_ADV=m
 # CONFIG_BATMAN_ADV_BATMAN_V is not set
diff --git a/arch/mips/configs/gpr_defconfig b/arch/mips/configs/gpr_defconfig
index 47016655a089..7834569a8314 100644
--- a/arch/mips/configs/gpr_defconfig
+++ b/arch/mips/configs/gpr_defconfig
@@ -91,7 +91,6 @@ CONFIG_ATM_BR2684=m
 CONFIG_BRIDGE=m
 CONFIG_VLAN_8021Q=m
 CONFIG_LLC2=m
-CONFIG_ATALK=m
 CONFIG_DEV_APPLETALK=m
 CONFIG_IPDDP=m
 CONFIG_IPDDP_ENCAP=y
diff --git a/arch/mips/configs/malta_defconfig b/arch/mips/configs/malta_defconfig
index 61c9d5cd1a75..89d7c47ca7f0 100644
--- a/arch/mips/configs/malta_defconfig
+++ b/arch/mips/configs/malta_defconfig
@@ -170,7 +170,6 @@ CONFIG_IP_SCTP=m
 CONFIG_BRIDGE=m
 CONFIG_VLAN_8021Q=m
 CONFIG_VLAN_8021Q_GVRP=y
-CONFIG_ATALK=m
 CONFIG_DEV_APPLETALK=m
 CONFIG_IPDDP=m
 CONFIG_IPDDP_ENCAP=y
diff --git a/arch/mips/configs/malta_kvm_defconfig b/arch/mips/configs/malta_kvm_defconfig
index f862fbc7fbb7..39c69af12adc 100644
--- a/arch/mips/configs/malta_kvm_defconfig
+++ b/arch/mips/configs/malta_kvm_defconfig
@@ -174,7 +174,6 @@ CONFIG_IP_SCTP=m
 CONFIG_BRIDGE=m
 CONFIG_VLAN_8021Q=m
 CONFIG_VLAN_8021Q_GVRP=y
-CONFIG_ATALK=m
 CONFIG_DEV_APPLETALK=m
 CONFIG_IPDDP=m
 CONFIG_IPDDP_ENCAP=y
diff --git a/arch/mips/configs/malta_qemu_32r6_defconfig b/arch/mips/configs/malta_qemu_32r6_defconfig
index 14cdd23f1acb..5feb1dc43bae 100644
--- a/arch/mips/configs/malta_qemu_32r6_defconfig
+++ b/arch/mips/configs/malta_qemu_32r6_defconfig
@@ -46,7 +46,6 @@ CONFIG_INET6_IPCOMP=m
 CONFIG_IPV6_TUNNEL=m
 CONFIG_BRIDGE=m
 CONFIG_VLAN_8021Q=m
-CONFIG_ATALK=m
 CONFIG_DEV_APPLETALK=m
 CONFIG_IPDDP=m
 CONFIG_IPDDP_ENCAP=y
diff --git a/arch/mips/configs/maltaaprp_defconfig b/arch/mips/configs/maltaaprp_defconfig
index 2943593264b9..a69fb992b82a 100644
--- a/arch/mips/configs/maltaaprp_defconfig
+++ b/arch/mips/configs/maltaaprp_defconfig
@@ -48,7 +48,6 @@ CONFIG_INET6_IPCOMP=m
 CONFIG_IPV6_TUNNEL=m
 CONFIG_BRIDGE=m
 CONFIG_VLAN_8021Q=m
-CONFIG_ATALK=m
 CONFIG_DEV_APPLETALK=m
 CONFIG_IPDDP=m
 CONFIG_IPDDP_ENCAP=y
diff --git a/arch/mips/configs/maltasmvp_defconfig b/arch/mips/configs/maltasmvp_defconfig
index 47226fca0548..689edb56c055 100644
--- a/arch/mips/configs/maltasmvp_defconfig
+++ b/arch/mips/configs/maltasmvp_defconfig
@@ -49,7 +49,6 @@ CONFIG_INET6_IPCOMP=m
 CONFIG_IPV6_TUNNEL=m
 CONFIG_BRIDGE=m
 CONFIG_VLAN_8021Q=m
-CONFIG_ATALK=m
 CONFIG_DEV_APPLETALK=m
 CONFIG_IPDDP=m
 CONFIG_IPDDP_ENCAP=y
diff --git a/arch/mips/configs/maltasmvp_eva_defconfig b/arch/mips/configs/maltasmvp_eva_defconfig
index 09187a78409f..a56db606b2d8 100644
--- a/arch/mips/configs/maltasmvp_eva_defconfig
+++ b/arch/mips/configs/maltasmvp_eva_defconfig
@@ -50,7 +50,6 @@ CONFIG_INET6_IPCOMP=m
 CONFIG_IPV6_TUNNEL=m
 CONFIG_BRIDGE=m
 CONFIG_VLAN_8021Q=m
-CONFIG_ATALK=m
 CONFIG_DEV_APPLETALK=m
 CONFIG_IPDDP=m
 CONFIG_IPDDP_ENCAP=y
diff --git a/arch/mips/configs/maltaup_defconfig b/arch/mips/configs/maltaup_defconfig
index a80783097c1e..ee10762ab593 100644
--- a/arch/mips/configs/maltaup_defconfig
+++ b/arch/mips/configs/maltaup_defconfig
@@ -47,7 +47,6 @@ CONFIG_INET6_IPCOMP=m
 CONFIG_IPV6_TUNNEL=m
 CONFIG_BRIDGE=m
 CONFIG_VLAN_8021Q=m
-CONFIG_ATALK=m
 CONFIG_DEV_APPLETALK=m
 CONFIG_IPDDP=m
 CONFIG_IPDDP_ENCAP=y
diff --git a/arch/mips/configs/maltaup_xpa_defconfig b/arch/mips/configs/maltaup_xpa_defconfig
index e660c503654e..0e207bb0f794 100644
--- a/arch/mips/configs/maltaup_xpa_defconfig
+++ b/arch/mips/configs/maltaup_xpa_defconfig
@@ -171,7 +171,6 @@ CONFIG_IP_SCTP=m
 CONFIG_BRIDGE=m
 CONFIG_VLAN_8021Q=m
 CONFIG_VLAN_8021Q_GVRP=y
-CONFIG_ATALK=m
 CONFIG_DEV_APPLETALK=m
 CONFIG_IPDDP=m
 CONFIG_IPDDP_ENCAP=y
diff --git a/arch/mips/configs/mtx1_defconfig b/arch/mips/configs/mtx1_defconfig
index a1c374bd4785..46b40784a828 100644
--- a/arch/mips/configs/mtx1_defconfig
+++ b/arch/mips/configs/mtx1_defconfig
@@ -136,7 +136,6 @@ CONFIG_ATM_BR2684=m
 CONFIG_BRIDGE=m
 CONFIG_VLAN_8021Q=m
 CONFIG_LLC2=m
-CONFIG_ATALK=m
 CONFIG_DEV_APPLETALK=m
 CONFIG_IPDDP=m
 CONFIG_IPDDP_ENCAP=y
diff --git a/arch/powerpc/configs/ppc6xx_defconfig b/arch/powerpc/configs/ppc6xx_defconfig
index c9bdaed06d03..f528cab1c6cf 100644
--- a/arch/powerpc/configs/ppc6xx_defconfig
+++ b/arch/powerpc/configs/ppc6xx_defconfig
@@ -228,7 +228,6 @@ CONFIG_ATM=m
 CONFIG_ATM_BR2684=m
 CONFIG_BRIDGE=m
 CONFIG_VLAN_8021Q=m
-CONFIG_ATALK=m
 CONFIG_DEV_APPLETALK=m
 CONFIG_IPDDP=m
 CONFIG_IPDDP_ENCAP=y
diff --git a/arch/sh/configs/landisk_defconfig b/arch/sh/configs/landisk_defconfig
index 4c39a23e6e0d..2b7e10c9acee 100644
--- a/arch/sh/configs/landisk_defconfig
+++ b/arch/sh/configs/landisk_defconfig
@@ -24,7 +24,6 @@ CONFIG_IP_ADVANCED_ROUTER=y
 CONFIG_IP_PNP=y
 # CONFIG_IPV6 is not set
 CONFIG_NETFILTER=y
-CONFIG_ATALK=m
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_RAM=y
 CONFIG_ATA=y
-- 
2.54.0


