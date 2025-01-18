Return-Path: <linux-mips+bounces-7507-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0700EA15E08
	for <lists+linux-mips@lfdr.de>; Sat, 18 Jan 2025 17:23:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E2CF3A72FB
	for <lists+linux-mips@lfdr.de>; Sat, 18 Jan 2025 16:23:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA145194C6A;
	Sat, 18 Jan 2025 16:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="S/Ayb/YH"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C839C189BAC
	for <linux-mips@vger.kernel.org>; Sat, 18 Jan 2025 16:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737217396; cv=none; b=E+Ngq47GNEO+blmVif7Y7YHrqj4PBnKh/C6oofzE9Q1VD4THJEinEulkfH3GnBCsoMuua/p0KQc9gli+J6bbB82mijx7CjjlxiFX6XvHqKnO8pMYexycABn1Gu74Ctf99tdkun4GwGvr033Bl1UpMtwnBm5elhADvCIMBn1S55k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737217396; c=relaxed/simple;
	bh=3g781wA8p83JdlWMkLZF0pSfvw2/Zl1r2HKUUfb7Ws0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZDoCwRaW/PbSGV/njTa+lgAvvM35zJKBPilX+5K5bMszDFdHvXEw97jzJyBNLR7dJh4LO6Bp6tMsZFggMx930iX3X6KcEBZAk5dPNJ2aJqhI5AbKkltSRKYlYMP8AlaW/HhHzcUMUKagk0nHHVHimq8myS+apHz8D7ZtPwR9Plw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=S/Ayb/YH; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737217393;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=cFXpAoeZTyHgkVJgpucOy2vHSnIf2dKT4wvoNIaKPRg=;
	b=S/Ayb/YHjKlBUvSKc2dFZQsujljsQ/CrBGQUOMsiML466L9DC6aZV1RfISsXSgqT5bDGgx
	AAbE+tMRLMIUifJfdEEg4BWSXOv+Tob29qkYbgSnxyVB81fH0yigIM5is6uwNR8r/4qTU5
	Ejacli/Wzl/LFuwsdSnWANLSMWbadO4=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-622-4F6_YGO5NJaaNJm0OC0uIw-1; Sat,
 18 Jan 2025 11:23:09 -0500
X-MC-Unique: 4F6_YGO5NJaaNJm0OC0uIw-1
X-Mimecast-MFC-AGG-ID: 4F6_YGO5NJaaNJm0OC0uIw
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BE90819560B7;
	Sat, 18 Jan 2025 16:23:07 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.224.39])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 3157719560A3;
	Sat, 18 Jan 2025 16:23:04 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Sat, 18 Jan 2025 17:22:42 +0100 (CET)
Date: Sat, 18 Jan 2025 17:22:38 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Kees Cook <kees@kernel.org>, Andy Lutomirski <luto@amacapital.net>,
	Will Drewry <wad@chromium.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Q: arch/mips && __secure_computing(sd) with sd != NULL
Message-ID: <20250118162238.GA31924@redhat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

From include/linux/seccomp.h

	#ifdef CONFIG_HAVE_ARCH_SECCOMP_FILTER
	extern int __secure_computing(const struct seccomp_data *sd);

in this case sd can be NULL, and only arch/mips/kernel/ptrace.c uses sd != NULL

	#else
	static inline int __secure_computing(const struct seccomp_data *sd)
	{
		secure_computing_strict(sd->nr);
		return 0;
	}

in this case __secure_computing(NULL) will crash. This looks confusing.
And unnecessary.

Now lets look at arch/mips/kernel/ptrace.c:syscall_trace_enter()

	#ifdef CONFIG_SECCOMP
		if (unlikely(test_thread_flag(TIF_SECCOMP))) {
			int ret, i;
			struct seccomp_data sd;
			unsigned long args[6];

			sd.nr = current_thread_info()->syscall;
			sd.arch = syscall_get_arch(current);
			syscall_get_arguments(current, regs, args);
			for (i = 0; i < 6; i++)
				sd.args[i] = args[i];
			sd.instruction_pointer = KSTK_EIP(current);

			ret = __secure_computing(&sd);
			if (ret == -1)
				return ret;
		}
	#endif

Why? arch/mips/Kconfig selects HAVE_ARCH_SECCOMP_FILTER so it can just do

	#ifdef CONFIG_SECCOMP
		if (unlikely(test_thread_flag(TIF_SECCOMP))) {
			int ret = __secure_computing(NULL);
			if (ret == -1)
				return ret;
		}
	#endif

and rely on populate_seccomp_data() and sd == NULL checks in __secure_computing()
path ?

And given that arch/mips doesn't define CONFIG_GENERIC_ENTRY it can even do

	int ret = secure_computing();
	if (ret == -1)
		return ret;

Did I miss something?

Note that if we change arch/mips we can do more cleanups, in particular
__secure_computing(sd) no longer needs the argument.

Oleg.


