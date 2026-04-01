Return-Path: <linux-mips+bounces-14002-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KG72CdbZzGnnWwYAu9opvQ
	(envelope-from <linux-mips+bounces-14002-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 01 Apr 2026 10:39:50 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6722D376F40
	for <lists+linux-mips@lfdr.de>; Wed, 01 Apr 2026 10:39:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DB272307C876
	for <lists+linux-mips@lfdr.de>; Wed,  1 Apr 2026 08:28:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F35A23A9DB0;
	Wed,  1 Apr 2026 08:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yiVwdVRb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gAou2kim";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yiVwdVRb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gAou2kim"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4373A9DB2
	for <linux-mips@vger.kernel.org>; Wed,  1 Apr 2026 08:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775032093; cv=none; b=VY4swMtz2gu8j0oPEtLXAw5WvxeTEdTWEpdWWc6MY6NG9ctpUgiL9njK38Fib/iyJQo1EkaXKNrs1N9HbCxYMk7QrsC66pIIr2nJXQUbrfx2ZaMRQtOqDHFkhxT3lhCO6FxvTkqGV91NQeIo0zhQOn2TAjIEk2C+o5Meoet0vOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775032093; c=relaxed/simple;
	bh=qwOXDX7G8MhO+QaH+yjKUggxEV51zUfkF2ccJYwCEOE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MwV+SE06QRNdBMwSijHBFP9cO1mJ/1J44L7xN717OKms5JwZq8X7qvqWx3tj2e1UkJlR/DyRu4ODfjihx9dlQfo6aHNHQNs3WXt9eLCK+DBaxqa3lQNxYNtJgt/lLy3RopaxQ6smJFu9Rv6y/uuFcNTY2kDfqwiZQBa+OVjBodA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yiVwdVRb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gAou2kim; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yiVwdVRb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gAou2kim; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BE4464D2B4;
	Wed,  1 Apr 2026 08:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775032090; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=b6rf6yLk5C2Xs6Db3RHdZP73Kvw90+UjkT/ZJ6nbnps=;
	b=yiVwdVRbxVBMNMvYT1PtN16ta2oYoCehXnYISnmK8PNl7+w5NLHfDuuif3ap4KSC6a+WBo
	uJgnqJ4CCcq1PjMsqoU4f9J0XrtHP1aOvHggL4evkN7FqlxWzM9kOjM1EavAUMWRWwTnGL
	nwRTtg7bnxmTIvi4fDdLBiucK8wpqgM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775032090;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=b6rf6yLk5C2Xs6Db3RHdZP73Kvw90+UjkT/ZJ6nbnps=;
	b=gAou2kimX0o1rwu3H8rAWkHbHuXUkMGiMP0AkaMqILQ3/qiJeOHXkS8IcmD2qGEy/Zk2nY
	cZ1w5yAwFyt9xDBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775032090; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=b6rf6yLk5C2Xs6Db3RHdZP73Kvw90+UjkT/ZJ6nbnps=;
	b=yiVwdVRbxVBMNMvYT1PtN16ta2oYoCehXnYISnmK8PNl7+w5NLHfDuuif3ap4KSC6a+WBo
	uJgnqJ4CCcq1PjMsqoU4f9J0XrtHP1aOvHggL4evkN7FqlxWzM9kOjM1EavAUMWRWwTnGL
	nwRTtg7bnxmTIvi4fDdLBiucK8wpqgM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775032090;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=b6rf6yLk5C2Xs6Db3RHdZP73Kvw90+UjkT/ZJ6nbnps=;
	b=gAou2kimX0o1rwu3H8rAWkHbHuXUkMGiMP0AkaMqILQ3/qiJeOHXkS8IcmD2qGEy/Zk2nY
	cZ1w5yAwFyt9xDBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 83D9F4A0B0;
	Wed,  1 Apr 2026 08:28:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Zey2HhrXzGmzBgAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Wed, 01 Apr 2026 08:28:10 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: tsbogend@alpha.franken.de,
	arnd@arndb.de
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] arch/mips: Drop CONFIG_FIRMWARE_EDID from defconfig files
Date: Wed,  1 Apr 2026 10:27:57 +0200
Message-ID: <20260401082805.214198-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.de:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14002-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,suse.de:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6722D376F40
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

CONFIG_FIRMWARE_EDID=y depends on X86 or EFI_GENERIC_STUB. Neither is
true here, so drop the lines from the defconfig files.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 arch/mips/configs/ip32_defconfig            | 1 -
 arch/mips/configs/lemote2f_defconfig        | 1 -
 arch/mips/configs/malta_qemu_32r6_defconfig | 1 -
 arch/mips/configs/maltaaprp_defconfig       | 1 -
 arch/mips/configs/maltasmvp_defconfig       | 1 -
 arch/mips/configs/maltasmvp_eva_defconfig   | 1 -
 arch/mips/configs/maltaup_defconfig         | 1 -
 7 files changed, 7 deletions(-)

diff --git a/arch/mips/configs/ip32_defconfig b/arch/mips/configs/ip32_defconfig
index 7568838eb08b..ad60c11dd660 100644
--- a/arch/mips/configs/ip32_defconfig
+++ b/arch/mips/configs/ip32_defconfig
@@ -71,7 +71,6 @@ CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_HW_RANDOM=y
 CONFIG_WATCHDOG=y
 CONFIG_FB=y
-CONFIG_FIRMWARE_EDID=y
 CONFIG_FB_GBE=y
 # CONFIG_VGA_CONSOLE is not set
 CONFIG_FRAMEBUFFER_CONSOLE=y
diff --git a/arch/mips/configs/lemote2f_defconfig b/arch/mips/configs/lemote2f_defconfig
index 8d3f20ed19b5..7eed322a986f 100644
--- a/arch/mips/configs/lemote2f_defconfig
+++ b/arch/mips/configs/lemote2f_defconfig
@@ -136,7 +136,6 @@ CONFIG_FB_SIS_300=y
 CONFIG_FB_SIS_315=y
 CONFIG_FB_SIMPLE=y
 CONFIG_FB_SM712=y
-CONFIG_FIRMWARE_EDID=y
 CONFIG_FB_MODE_HELPERS=y
 CONFIG_FB_TILEBLITTING=y
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
diff --git a/arch/mips/configs/malta_qemu_32r6_defconfig b/arch/mips/configs/malta_qemu_32r6_defconfig
index accb471a1d93..4bc5ea492a94 100644
--- a/arch/mips/configs/malta_qemu_32r6_defconfig
+++ b/arch/mips/configs/malta_qemu_32r6_defconfig
@@ -129,7 +129,6 @@ CONFIG_POWER_RESET_PIIX4_POWEROFF=y
 CONFIG_POWER_RESET_SYSCON=y
 # CONFIG_HWMON is not set
 CONFIG_FB=y
-CONFIG_FIRMWARE_EDID=y
 CONFIG_FB_MATROX=y
 CONFIG_FB_MATROX_G=y
 CONFIG_USB=y
diff --git a/arch/mips/configs/maltaaprp_defconfig b/arch/mips/configs/maltaaprp_defconfig
index 6bda67c5f68f..3fc0bfff9795 100644
--- a/arch/mips/configs/maltaaprp_defconfig
+++ b/arch/mips/configs/maltaaprp_defconfig
@@ -130,7 +130,6 @@ CONFIG_POWER_RESET_PIIX4_POWEROFF=y
 CONFIG_POWER_RESET_SYSCON=y
 # CONFIG_HWMON is not set
 CONFIG_FB=y
-CONFIG_FIRMWARE_EDID=y
 CONFIG_FB_MATROX=y
 CONFIG_FB_MATROX_G=y
 CONFIG_USB=y
diff --git a/arch/mips/configs/maltasmvp_defconfig b/arch/mips/configs/maltasmvp_defconfig
index e4082537f80f..eefaa45defb5 100644
--- a/arch/mips/configs/maltasmvp_defconfig
+++ b/arch/mips/configs/maltasmvp_defconfig
@@ -130,7 +130,6 @@ CONFIG_POWER_RESET_PIIX4_POWEROFF=y
 CONFIG_POWER_RESET_SYSCON=y
 # CONFIG_HWMON is not set
 CONFIG_FB=y
-CONFIG_FIRMWARE_EDID=y
 CONFIG_FB_MATROX=y
 CONFIG_FB_MATROX_G=y
 CONFIG_USB=y
diff --git a/arch/mips/configs/maltasmvp_eva_defconfig b/arch/mips/configs/maltasmvp_eva_defconfig
index 58f5af45fa98..691356ef2983 100644
--- a/arch/mips/configs/maltasmvp_eva_defconfig
+++ b/arch/mips/configs/maltasmvp_eva_defconfig
@@ -133,7 +133,6 @@ CONFIG_POWER_RESET_PIIX4_POWEROFF=y
 CONFIG_POWER_RESET_SYSCON=y
 # CONFIG_HWMON is not set
 CONFIG_FB=y
-CONFIG_FIRMWARE_EDID=y
 CONFIG_FB_MATROX=y
 CONFIG_FB_MATROX_G=y
 CONFIG_USB=y
diff --git a/arch/mips/configs/maltaup_defconfig b/arch/mips/configs/maltaup_defconfig
index 9bfef7de0d1c..0d02e26ef6f5 100644
--- a/arch/mips/configs/maltaup_defconfig
+++ b/arch/mips/configs/maltaup_defconfig
@@ -129,7 +129,6 @@ CONFIG_POWER_RESET_PIIX4_POWEROFF=y
 CONFIG_POWER_RESET_SYSCON=y
 # CONFIG_HWMON is not set
 CONFIG_FB=y
-CONFIG_FIRMWARE_EDID=y
 CONFIG_FB_MATROX=y
 CONFIG_FB_MATROX_G=y
 CONFIG_USB=y
-- 
2.53.0


