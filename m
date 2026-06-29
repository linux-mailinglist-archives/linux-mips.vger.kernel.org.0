Return-Path: <linux-mips+bounces-15242-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2LxaCjUyQmpo1gkAu9opvQ
	(envelope-from <linux-mips+bounces-15242-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 29 Jun 2026 10:52:05 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5346D7B00
	for <lists+linux-mips@lfdr.de>; Mon, 29 Jun 2026 10:52:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=uniontech.com header.s=onoh2408 header.b=OG609C4Q;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15242-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-mips+bounces-15242-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=uniontech.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 80E1C30045A6
	for <lists+linux-mips@lfdr.de>; Mon, 29 Jun 2026 08:52:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42E5D3F822F;
	Mon, 29 Jun 2026 08:52:01 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7593F823F;
	Mon, 29 Jun 2026 08:51:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782723121; cv=none; b=gRFUPF1j4gqN5RtjmVv9wVKLQCMmzFG5U+ABB2oVqFgf+jrjUbuoQQCoYn21mbzJHWHm5kCB6Fnt72W4KY7BIyL0XdWmKkwNO50sj71wO7w59wVx7fzHnz3ErK7fRHZlRH5byY5m/c2VQLUo1bM5+HqRS0NU8lKYnBXulSTFKIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782723121; c=relaxed/simple;
	bh=KBbwYRYPW0GMqgyqxF9nRWGH7Tc+vo/MfqUayDiJGBA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GZaiW+Papy0C/pu63Z/4V/9J4rfR08POA73KC2tUVbOY0X27hHq6Jutwdga+QhD4Nh5ltZv+B9GOH0GCdXqlp7ZsSVychEnCLr/xcGUG5UxlDytLcOctvLf0sDpSW84wjbOhekCEMhs1Em/ehLrDsw5vfgBM/XtIf1FY4t2g51g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=OG609C4Q; arc=none smtp.client-ip=18.194.254.142
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1782723076;
	bh=GPlWodIq++298AjwM0SiZYMKvCA7hqnNN+2a2GtbAvA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=OG609C4QtKEu8VeKw0c/Vc1cTZbiXR0ll/gqt/3Pw8n8Wu9APT3Re13Q1A8x5AJv8
	 GOIzPB9mD8w/fPTW69toz0N1MB25Nv4SD4Nj21JPJAoRtsT+KrKTKAX6z2XoKZT0Zf
	 PbnG4uuXzqD0MvHu4T4FJ6EigubmIbvRTG+ONRhE=
X-QQ-mid: zesmtpgz6t1782723056t15444658
X-QQ-Originating-IP: HKqs9Lg2tlHObXLTPbb2GpE5viamZAU0Zt2hPPRyweU=
Received: from PEN202512010004 ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 29 Jun 2026 16:50:55 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 2402098009740855058
EX-QQ-RecipientCnt: 11
From: raoxu <raoxu@uniontech.com>
To: tsbogend@alpha.franken.de
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-mips@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	raoxu@uniontech.com,
	stable@vger.kernel.org
Subject: [PATCH net] net: sgi: ioc3-eth: unregister netdev before freeing DMA rings
Date: Mon, 29 Jun 2026 16:50:53 +0800
Message-ID: <40CD736C4911C181+20260629085053.964383-1-raoxu@uniontech.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: OGRTx1KypL8CZphGXTz5mxS25mjt2eoksqlynM1tgSUjzdKQg+oWhJAV
	aVO7tsiIqQb7OCNyk2jGxS03j7G9AM+HvqvkXMX64d3RFQy1+MNIFLDiOmy5bMoLBvoUP1y
	sHvQaz/JaP44OVKHw7DU10awJ6li5TRUjIwGR4ZuRD/pY0DzihhKupZQXhSKjpsG7RwlC1e
	3sgB1Mc+j1kLT+0H8s/rN0SrAY7ADyCr9EZ6/NA15Gvx2T6uOpHOs/qhMYZlQ8hXRk53k4C
	8aHVXzBs+AX4JfAk1Sh/RUjl+9EeOLjy7rLKmqhevsNBDiLNwlxfIkpz2RTupEmodYHRHZF
	RvBnT0c7h0LyBJAeY1Z9TG/uNjorfbpYFjwBdQhTTI7D+Fj8ZqTIbUkb2bCRfDRvLnFDb5J
	+Oji7vdzd2558B/925Ensm6y3mHyte6YJs3ldips64EbwO3PIxErtWR6PY5l02bwPk1Ggu2
	fg46VC3kPLKGq5XT/kjGh7xtLmly9KR0HowjeWvxohj/VzKDwZ1bjm00KUrKyu/7N5ZsrBS
	VUSlWIMD0pa8E+Ye9qx2iBStIgQjcpsxe1v6V0nV8s5SwOM674nLvRoWnpzYvLHep1W8AIk
	fsFv6dCyyPT0uKVjwc9OU2tHPxmabJ7b8dGLOMQkrniF5biYjsY8iekvRbJm5AT4+kpE5Ic
	XMkPwPfOrrqGREYSUbuI8KdEpRG7KVl2YXvnkNy41k3p9bKSFIKwyUZyUIth43Eo+0fsIjN
	PQxGU0luSpoLW2Pt60tJkgXFDkP6PfWiGjuqeAlOa6LqwYPPvB/eKgUf9sF2UHzg4/QRVgC
	rqdIPdvsMkl8UczqZZoAD3VDpCZFc0Xy8tw/Bgtn58qee7ieYC5OgwGZwCiivIUQMQZcbTZ
	WqMA9r1F/S8aQiEciou3sSB5baqFwRUQKTrMoZJ1h9ZIjcNvQBQk0DlOCfoxT2MGnYxqsSV
	sRqsz6rEVQZHgr1q2IiXqfh6Qlou1vAusyxtUfudY+/62klR6Au6peSNMARsTnCA8t1Ck3s
	zrCcc5IJCmyqcR1NcqoV/2lobDNA2UlZKvmYxfFNNZjRlFV0G8
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[uniontech.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[uniontech.com:s=onoh2408];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[raoxu@uniontech.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:tsbogend@alpha.franken.de,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:linux-mips@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:raoxu@uniontech.com,m:stable@vger.kernel.org,m:andrew@lunn.ch,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15242-lists,linux-mips=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[uniontech.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[raoxu@uniontech.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,netdev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[uniontech.com:dkim,uniontech.com:email,uniontech.com:mid,uniontech.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7C5346D7B00

From: Xu Rao <raoxu@uniontech.com>

ioc3eth_remove() frees the coherent RX and TX descriptor rings before
unregistering the netdev. If the interface is running,
unregister_netdev() invokes ioc3_close() through ndo_stop.

ioc3_close() stops the device and then calls ioc3_free_rx_bufs() and
ioc3_clean_tx_ring(). Both cleanup functions access descriptors in the
rings, so the current ordering causes CPU accesses to freed coherent
memory. Until ioc3_stop() disables RX and TX DMA, the device may also
continue using the freed ring addresses.

Unregister the netdev before releasing the rings. This lets the core
close a running interface and quiesce the device while the rings are
still valid. Keep the explicit timer deletion because ndo_stop is not
called when the interface is already down.

Fixes: c7b572747549 ("net: sgi: ioc3-eth: allocate space for desc rings only once")
Cc: stable@vger.kernel.org
Signed-off-by: Xu Rao <raoxu@uniontech.com>
---
 drivers/net/ethernet/sgi/ioc3-eth.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/sgi/ioc3-eth.c b/drivers/net/ethernet/sgi/ioc3-eth.c
index 261f2d35d579..009f37105eaf 100644
--- a/drivers/net/ethernet/sgi/ioc3-eth.c
+++ b/drivers/net/ethernet/sgi/ioc3-eth.c
@@ -967,11 +967,12 @@ static void ioc3eth_remove(struct platform_device *pdev)
 	struct net_device *dev = platform_get_drvdata(pdev);
 	struct ioc3_private *ip = netdev_priv(dev);
 
+	unregister_netdev(dev);
+	timer_delete_sync(&ip->ioc3_timer);
+
 	dma_free_coherent(ip->dma_dev, RX_RING_SIZE, ip->rxr, ip->rxr_dma);
 	dma_free_coherent(ip->dma_dev, TX_RING_SIZE + SZ_16K - 1, ip->tx_ring, ip->txr_dma);
 
-	unregister_netdev(dev);
-	timer_delete_sync(&ip->ioc3_timer);
 	free_netdev(dev);
 }
 
-- 
2.50.1


