Return-Path: <linux-mips+bounces-7641-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C5DA22BE6
	for <lists+linux-mips@lfdr.de>; Thu, 30 Jan 2025 11:49:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A2C83A1C04
	for <lists+linux-mips@lfdr.de>; Thu, 30 Jan 2025 10:49:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32C7C1B85CA;
	Thu, 30 Jan 2025 10:49:18 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0EF6286A9;
	Thu, 30 Jan 2025 10:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738234158; cv=none; b=CMDHLkJIEFJhgZyQZRv1C+oXIMEwOeH8norZeSWPv/jBtLc6S6YiRNu+kh+Y85dhoi1XhQM0SMec2HQHSPfRPgqTqu4e2K3WAkDQOrVKNCNro9NYEZnPNzV6wQ1veniAy6rf4V9PUQKvHU4L8vp1XP7wFp+2Epfh1LVhX6U6vJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738234158; c=relaxed/simple;
	bh=0RTanvAzYD+EF8kxdht5R+xzJ2uGLD4tho9tZLyYhd4=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=dsuVBM2h7m20D6Vjwp1pr16GfWTrRARQg0t1wCCBK6Fz6MWiwGme/vLM919yn19nu4QuJpNSf4tQgRL9CpvuqnQk69j60Y1qhck0XAfVHfWvtLbTh76JMZoi/sWkn2f19kBfQPTx2qTkvyp3bAqcL298Mm+rvTnMStFhCHUPlrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=fail smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=alpha.franken.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CCE5B21843;
	Thu, 30 Jan 2025 10:49:12 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AFAA21364B;
	Thu, 30 Jan 2025 10:49:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id bCLBKihZm2dzMAAAD6G6ig
	(envelope-from <tsbogend@alpha.franken.de>); Thu, 30 Jan 2025 10:49:12 +0000
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Revert "mips: fix shmctl/semctl/msgctl syscall for o32"
Date: Thu, 30 Jan 2025 11:48:56 +0100
Message-Id: <20250130104857.56251-1-tsbogend@alpha.franken.de>
X-Mailer: git-send-email 2.35.3
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-0.999];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWO(0.00)[2];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

This reverts commit bc7584e009c39375294794f7ca751a6b2622c425.

The split IPC system calls for o32 have been introduced with modern
version only. Changing this breaks ABI.

Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/mips/kernel/syscalls/syscall_o32.tbl | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/mips/kernel/syscalls/syscall_o32.tbl b/arch/mips/kernel/syscalls/syscall_o32.tbl
index e8a57c206758..349b8aad1159 100644
--- a/arch/mips/kernel/syscalls/syscall_o32.tbl
+++ b/arch/mips/kernel/syscalls/syscall_o32.tbl
@@ -382,15 +382,15 @@
 368	o32	io_pgetevents			sys_io_pgetevents_time32	compat_sys_io_pgetevents
 # room for arch specific calls
 393	o32	semget				sys_semget
-394	o32	semctl				sys_old_semctl		compat_sys_old_semctl
+394	o32	semctl				sys_semctl			compat_sys_semctl
 395	o32	shmget				sys_shmget
-396	o32	shmctl				sys_old_shmctl		compat_sys_old_shmctl
+396	o32	shmctl				sys_shmctl			compat_sys_shmctl
 397	o32	shmat				sys_shmat			compat_sys_shmat
 398	o32	shmdt				sys_shmdt
 399	o32	msgget				sys_msgget
 400	o32	msgsnd				sys_msgsnd			compat_sys_msgsnd
 401	o32	msgrcv				sys_msgrcv			compat_sys_msgrcv
-402	o32	msgctl				sys_old_msgctl		compat_sys_old_msgctl
+402	o32	msgctl				sys_msgctl			compat_sys_msgctl
 403	o32	clock_gettime64			sys_clock_gettime		sys_clock_gettime
 404	o32	clock_settime64			sys_clock_settime		sys_clock_settime
 405	o32	clock_adjtime64			sys_clock_adjtime		sys_clock_adjtime
-- 
2.35.3


