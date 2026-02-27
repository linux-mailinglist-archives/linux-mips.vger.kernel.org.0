Return-Path: <linux-mips+bounces-13277-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yOtNMP9AoWnsrQQAu9opvQ
	(envelope-from <linux-mips+bounces-13277-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 27 Feb 2026 08:00:15 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F371B39B9
	for <lists+linux-mips@lfdr.de>; Fri, 27 Feb 2026 08:00:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4E7E4316E141
	for <lists+linux-mips@lfdr.de>; Fri, 27 Feb 2026 06:58:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 746F83DA7F7;
	Fri, 27 Feb 2026 06:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="WM9sl9D4";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="97LPGIJ+"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88433ECBD2;
	Fri, 27 Feb 2026 06:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772175473; cv=none; b=npLaoErjgLMaGk/Mlx95OAqdDVCJWOHHTon5layk8fz9/VCzrTxTjQ+clsxXQdpGsihumtPimbd1U1FOex//OKK0HEEICO7e29jvV1KbRK8DzkbGtJKCSsAthAqsTDYyGI5w8qhjx2tmJ2LfEXn4v80iVtdTvhMAWcFcrLROQoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772175473; c=relaxed/simple;
	bh=cLipKDdg+OqB2lTcsId3exf9QOD1Z347Ahh8ryEqWfA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DusfzcwtnjRQQOYGRR6CScmEqsuT/mm2m9hXq1SehZQ+McOKEpWV2bSx8cUXNhQUoPhZCAtCaqBoca5cblQXlEA/cFcgqEKFD5iGNezoW6gBc2Q1k76Bl7peVf9IJd0Pjgenh1o+yFbaZxfb4bZX1N+Mjkt0JEKj9CwwSLwRoHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=WM9sl9D4; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=97LPGIJ+; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772175470;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VxVvigSVkiA0ULS8sVET9zTxBqGaaQQOZYasgU53BKI=;
	b=WM9sl9D45G4EhBesYUN6X9bIzF4n7UWbfaWPLcczKr48l/eUKEn1PBHanrMc2xX9qALzHb
	oWc4oZFtQMPFhMkDNuPPX4obMLby73fs3uSz8CytLuQqxeAJwo/99arRzwuwDwb/qPXkup
	cplvt7DNdlg8oqDICn1/Re3b5SdHMhnDFLwzexrVMztfajKYA4pjFe0WgvFTMJA/lq/caI
	e++XWrqL6s+rRoW+XnrVAuqTObPMyz+nECA6+JwZcnuQTMJy8IQhbOSD7Z7XF4/AZH9d9K
	MJKlDPtA78I4V+o4QIX+mCO06mmdFyyurx8iWRuYyjxTgISGekzmX+cKedZZmw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772175470;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VxVvigSVkiA0ULS8sVET9zTxBqGaaQQOZYasgU53BKI=;
	b=97LPGIJ+SqRO5BCoiDwvuNzmWSD2Y2OZLcd5lia8oyY2WW1Hodb9e+KfCWyZzqdpsstEAH
	F6q5plVa/e4KTiCQ==
Date: Fri, 27 Feb 2026 07:57:46 +0100
Subject: [PATCH 7/7] vdso/gettimeofday: Verify COMPAT_32BIT_TIME
 interactions
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260227-vdso-compat_32bit_time-v1-7-3f0286a7bac3@linutronix.de>
References: <20260227-vdso-compat_32bit_time-v1-0-3f0286a7bac3@linutronix.de>
In-Reply-To: <20260227-vdso-compat_32bit_time-v1-0-3f0286a7bac3@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org, 
 Arnd Bergmann <arnd@arndb.de>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772175466; l=1692;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=cLipKDdg+OqB2lTcsId3exf9QOD1Z347Ahh8ryEqWfA=;
 b=E0vFBA+/8oxx+AiNSHHAbbL7OvIOo5Bn43vLxk0Bffm871HZFCm5mLjBLyPrKxdS2L+JikbEJ
 cnxOS5CW/3RA4cT6ZydiAjCUkTSMTDsFk6efPCwkKSdYgQIZ0a6ECwN
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,armlinux.org.uk,arm.com,linux.ibm.com,ellerman.id.au,gmail.com,alpha.franken.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13277-lists,linux-mips=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thomas.weissschuh@linutronix.de,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[linutronix.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-mips];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linutronix.de:mid,linutronix.de:dkim,linutronix.de:email]
X-Rspamd-Queue-Id: 28F371B39B9
X-Rspamd-Action: no action

If CONFIG_COMPAT_32BIT_TIME is disabled then the vDSO should not
provide any 32-bit time related functionality.

Add some build-time validations to make sure the architecture-specific
glue satisfies this requirement.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 lib/vdso/gettimeofday.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
index 4399e143d43a..0d134ac3dd84 100644
--- a/lib/vdso/gettimeofday.c
+++ b/lib/vdso/gettimeofday.c
@@ -6,6 +6,8 @@
 #include <vdso/datapage.h>
 #include <vdso/helpers.h>
 
+#include <linux/build_bug.h>
+
 /* Bring in default accessors */
 #include <vdso/vsyscall.h>
 
@@ -340,6 +342,8 @@ __cvdso_clock_gettime32_data(const struct vdso_time_data *vd, clockid_t clock,
 	struct __kernel_timespec ts;
 	bool ok;
 
+	BUILD_BUG_ON(!IS_ENABLED(CONFIG_COMPAT_32BIT_TIME));
+
 	ok = __cvdso_clock_gettime_common(vd, clock, &ts);
 
 	if (unlikely(!ok))
@@ -400,6 +404,8 @@ __cvdso_time_data(const struct vdso_time_data *vd, __kernel_old_time_t *time)
 	const struct vdso_clock *vc = vd->clock_data;
 	__kernel_old_time_t t;
 
+	BUILD_BUG_ON(sizeof(*time) != 8 && !IS_ENABLED(CONFIG_COMPAT_32BIT_TIME));
+
 	if (IS_ENABLED(CONFIG_TIME_NS) &&
 	    vc->clock_mode == VDSO_CLOCKMODE_TIMENS) {
 		vd = __arch_get_vdso_u_timens_data(vd);
@@ -491,6 +497,8 @@ __cvdso_clock_getres_time32_data(const struct vdso_time_data *vd, clockid_t cloc
 	struct __kernel_timespec ts;
 	bool ok;
 
+	BUILD_BUG_ON(!IS_ENABLED(CONFIG_COMPAT_32BIT_TIME));
+
 	ok = __cvdso_clock_getres_common(vd, clock, &ts);
 
 	if (unlikely(!ok))

-- 
2.53.0


