Return-Path: <linux-mips+bounces-15097-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gQnGH+J8MGq/TgUAu9opvQ
	(envelope-from <linux-mips+bounces-15097-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 16 Jun 2026 00:29:54 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5EB68A5D8
	for <lists+linux-mips@lfdr.de>; Tue, 16 Jun 2026 00:29:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=SMTzqsBd;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15097-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15097-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 08C5F307E6AC
	for <lists+linux-mips@lfdr.de>; Mon, 15 Jun 2026 22:29:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA72A3B892B;
	Mon, 15 Jun 2026 22:29:41 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9271C3B7B93;
	Mon, 15 Jun 2026 22:29:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781562581; cv=none; b=e1HN35vCRG6KWyi/X1aDdQtvZkQZAivCStSAZWFzfLpHXC/8iegsbjK9bC4spyUUNGwZCY1npl37HdiiEs78Cttv0lq6AwVkiGGInZLHqKC5C7ws4w/tN/TBNHMtOrWAFGQtiWxosYpGUw7YX5e7uId3TW0lpnl7Ch2EVpZaNxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781562581; c=relaxed/simple;
	bh=TWKAD0NsQOGoMn3BkUKU6QptmVz1vEcT3cIJelxSBNA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mHq+hkZXa29ZlR0drGBD5hkzHasnKki2wBOkCoxeN9mwu8A+7Nh4ItGSsy+Ju4j3lBwn9QNHp9OT5ecl4Hx3saNDATbK8G7l4PC7OH8wt4cMSwb3VGw9eEiBhUHMQa3nwwaOstEaqE3iX8i2v7cZCnIcIy2G6Es/GVuGFe9nhJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SMTzqsBd; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4AEA1F00A3A;
	Mon, 15 Jun 2026 22:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781562580;
	bh=OC3GfqVbozJPrEg3wXvMzIp5mX4dp118jI+UwZmvJdM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=SMTzqsBdcPDEyOG1ANlN4WMZ6cdRrA5BSzIJByTtqVQ+kVenE5809vICqdrJFkexk
	 aGyVReTCbL/e/KJ/9hK9QVgWLFG+7hpmhhPs8vQtj4BB38ICTG0lvys1M2scyqbQH5
	 2WW8Yu4BiKN6QKPcH6peko7uXVz++J2/4aaXXiqs6zWUEdsSQBkghikg5cA2/QnDuv
	 Ibz1aclffKpo5iAuzeL5xBoSvczrEAJdpnpgNs/TMiR794Dy2qzukq2D9NrmkuMmxo
	 9j8upnF+tnwDQiSjeTh6dtpoR/6mV80Y54bu3L5r1VHhmRQCD2N6EkGAlomNeosHI8
	 9jVJDDbh8r+YQ==
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
Subject: [PATCH net-next 1/2] appletalk: stop storing per-interface state in struct net_device
Date: Mon, 15 Jun 2026 15:29:34 -0700
Message-ID: <20260615222935.947233-2-kuba@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15097-lists,linux-mips=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DA5EB68A5D8

AppleTalk keeps its per-interface control block (struct atalk_iface)
directly in struct netdevice (dev->atalk_ptr). This is the only thing
tying the protocol into the core net_device layout and is the sole
blocker to moving AppleTalk out of tree.

Replace dev->atalk_ptr with a small ifindex-keyed hashtable internal
to ddp.c. The existing atalk_interfaces list stays the owner of the iface
objects; the hashtable is purely a fast dev->iface index and reuses
the same atalk_interfaces_lock.

AFAICT this patch does not make this code any more racy than it already
is, I'm sure Sashiko will point out some basically existing bugs.
AFAICT atalk_interfaces_lock is the innermost lock already.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
 .../networking/net_cachelines/net_device.rst  |  1 -
 include/linux/atalk.h                         |  8 +---
 include/linux/netdevice.h                     |  4 --
 net/appletalk/ddp.c                           | 48 +++++++++++++++++--
 4 files changed, 45 insertions(+), 16 deletions(-)

diff --git a/Documentation/networking/net_cachelines/net_device.rst b/Documentation/networking/net_cachelines/net_device.rst
index eb2e6851c6f6..512f6d6fa3d8 100644
--- a/Documentation/networking/net_cachelines/net_device.rst
+++ b/Documentation/networking/net_cachelines/net_device.rst
@@ -90,7 +90,6 @@ struct inet6_dev*                   ip6_ptr                     read_mostly
 struct vlan_info*                   vlan_info
 struct dsa_port*                    dsa_ptr
 struct tipc_bearer*                 tipc_ptr
-void*                               atalk_ptr
 struct wireless_dev*                ieee80211_ptr
 struct wpan_dev*                    ieee802154_ptr
 struct mpls_dev*                    mpls_ptr
diff --git a/include/linux/atalk.h b/include/linux/atalk.h
index a55bfc6567d0..ce7e6bfa9e2a 100644
--- a/include/linux/atalk.h
+++ b/include/linux/atalk.h
@@ -30,6 +30,7 @@ struct atalk_iface {
 #define ATIF_PROBE_FAIL	2		/* Probe collided */
 	struct atalk_netrange	nets;
 	struct atalk_iface	*next;
+	struct hlist_node	hash_node;	/* keyed on dev->ifindex */
 };
 	
 struct atalk_sock {
@@ -113,12 +114,7 @@ extern int aarp_proto_init(void);
 /* Inter module exports */
 
 /* Give a device find its atif control structure */
-#if IS_ENABLED(CONFIG_ATALK)
-static inline struct atalk_iface *atalk_find_dev(struct net_device *dev)
-{
-	return dev->atalk_ptr;
-}
-#endif
+extern struct atalk_iface *atalk_find_dev(struct net_device *dev);
 
 extern struct atalk_addr *atalk_find_dev_addr(struct net_device *dev);
 extern struct net_device *atrtr_get_dev(struct atalk_addr *sa);
diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index 7f4f0837c09f..655564621f28 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -1947,7 +1947,6 @@ enum netdev_reg_state {
  *	@vlan_info:	VLAN info
  *	@dsa_ptr:	dsa specific data
  *	@tipc_ptr:	TIPC specific data
- *	@atalk_ptr:	AppleTalk link
  *	@ip_ptr:	IPv4 specific data
  *	@ip6_ptr:	IPv6 specific data
  *	@ieee80211_ptr:	IEEE 802.11 specific data, assign before registering
@@ -2349,9 +2348,6 @@ struct net_device {
 #if IS_ENABLED(CONFIG_TIPC)
 	struct tipc_bearer __rcu *tipc_ptr;
 #endif
-#if IS_ENABLED(CONFIG_ATALK)
-	void 			*atalk_ptr;
-#endif
 #if IS_ENABLED(CONFIG_CFG80211)
 	struct wireless_dev	*ieee80211_ptr;
 #endif
diff --git a/net/appletalk/ddp.c b/net/appletalk/ddp.c
index 30a6dc06291c..afb86ce6e644 100644
--- a/net/appletalk/ddp.c
+++ b/net/appletalk/ddp.c
@@ -52,6 +52,7 @@
 #include <linux/termios.h>	/* For TIOCOUTQ/INQ */
 #include <linux/compat.h>
 #include <linux/slab.h>
+#include <linux/hashtable.h>
 #include <net/datalink.h>
 #include <net/psnap.h>
 #include <net/sock.h>
@@ -204,6 +205,33 @@ DEFINE_RWLOCK(atalk_routes_lock);
 struct atalk_iface *atalk_interfaces;
 DEFINE_RWLOCK(atalk_interfaces_lock);
 
+/* Fast dev->iface lookup, keyed on ifindex. Shares atalk_interfaces_lock with
+ * the atalk_interfaces list, which remains the owner of the iface objects.
+ */
+#define ATALK_IFACE_HASH_BITS	8
+static DEFINE_HASHTABLE(atalk_iface_hash, ATALK_IFACE_HASH_BITS);
+
+/* Find the iface for @dev. Caller must hold atalk_interfaces_lock. */
+static struct atalk_iface *__atalk_find_dev(struct net_device *dev)
+{
+	struct atalk_iface *iface;
+
+	hash_for_each_possible(atalk_iface_hash, iface, hash_node, dev->ifindex)
+		if (iface->dev == dev)
+			return iface;
+	return NULL;
+}
+
+struct atalk_iface *atalk_find_dev(struct net_device *dev)
+{
+	struct atalk_iface *iface;
+
+	read_lock_bh(&atalk_interfaces_lock);
+	iface = __atalk_find_dev(dev);
+	read_unlock_bh(&atalk_interfaces_lock);
+	return iface;
+}
+
 /* For probing devices or in a routerless network */
 struct atalk_route atrtr_default;
 
@@ -221,9 +249,9 @@ static void atif_drop_device(struct net_device *dev)
 	while ((tmp = *iface) != NULL) {
 		if (tmp->dev == dev) {
 			*iface = tmp->next;
+			hash_del(&tmp->hash_node);
 			dev_put(dev);
 			kfree(tmp);
-			dev->atalk_ptr = NULL;
 		} else
 			iface = &tmp->next;
 	}
@@ -240,13 +268,13 @@ static struct atalk_iface *atif_add_device(struct net_device *dev,
 
 	dev_hold(dev);
 	iface->dev = dev;
-	dev->atalk_ptr = iface;
 	iface->address = *sa;
 	iface->status = 0;
 
 	write_lock_bh(&atalk_interfaces_lock);
 	iface->next = atalk_interfaces;
 	atalk_interfaces = iface;
+	hash_add(atalk_iface_hash, &iface->hash_node, dev->ifindex);
 	write_unlock_bh(&atalk_interfaces_lock);
 out:
 	return iface;
@@ -347,8 +375,15 @@ static int atif_proxy_probe_device(struct atalk_iface *atif,
 
 struct atalk_addr *atalk_find_dev_addr(struct net_device *dev)
 {
-	struct atalk_iface *iface = dev->atalk_ptr;
-	return iface ? &iface->address : NULL;
+	struct atalk_addr *addr = NULL;
+	struct atalk_iface *iface;
+
+	read_lock_bh(&atalk_interfaces_lock);
+	iface = __atalk_find_dev(dev);
+	if (iface)
+		addr = &iface->address;
+	read_unlock_bh(&atalk_interfaces_lock);
+	return addr;
 }
 
 static struct atalk_addr *atalk_find_primary(void)
@@ -388,8 +423,10 @@ static struct atalk_addr *atalk_find_primary(void)
  */
 static struct atalk_iface *atalk_find_anynet(int node, struct net_device *dev)
 {
-	struct atalk_iface *iface = dev->atalk_ptr;
+	struct atalk_iface *iface;
 
+	read_lock_bh(&atalk_interfaces_lock);
+	iface = __atalk_find_dev(dev);
 	if (!iface || iface->status & ATIF_PROBE)
 		goto out_err;
 
@@ -398,6 +435,7 @@ static struct atalk_iface *atalk_find_anynet(int node, struct net_device *dev)
 	    node != ATADDR_ANYNODE)
 		goto out_err;
 out:
+	read_unlock_bh(&atalk_interfaces_lock);
 	return iface;
 out_err:
 	iface = NULL;
-- 
2.54.0


