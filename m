Return-Path: <linux-mips+bounces-7548-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 065BAA16DA3
	for <lists+linux-mips@lfdr.de>; Mon, 20 Jan 2025 14:45:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B58E01887046
	for <lists+linux-mips@lfdr.de>; Mon, 20 Jan 2025 13:45:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11DB21E2317;
	Mon, 20 Jan 2025 13:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iqvWCpR9"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571CE1E1C29
	for <linux-mips@vger.kernel.org>; Mon, 20 Jan 2025 13:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737380687; cv=none; b=dxMqcjW2/cub2jOH/tLpkSMwnuRGnFjt0WpYnZB3CE+4KXCl9AGDsptMVqKlmSupOVeIuH/u7d+rgUQGEW2PDoj2rVyGB6+WaVIl+xhxXqiaa5o9PT6+WBn+6mW+opesKno/Yu1s1F1w6Q0xfPSgwRllspjIoLFhi7DkXdMRBIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737380687; c=relaxed/simple;
	bh=ojYhnGV3y1rgipsvsbCHu+qz/unwOAEI9H2xqBk081c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZSphyexzKz6fg4eSXO7tg2NR+Pu65Rxz1fLdwVloHC04axJ7dBeD2/uWorcUZYQf5r+GmY/EkUNl8dUeFT0cdt/VvWIwKi46PwFQNzR+IIadsnw0rudQEfHf5dHYjksi1ByEDgNHeTL3zMDp24AhyP7Fu5cjI9/pjwwR/mAI1U4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iqvWCpR9; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737380685;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=esHaCH94LdGCcr/CRETDjlEYdI7GR+2kJhOxJ8F9Pps=;
	b=iqvWCpR9PdsODWPJKFOdoTyvcsfxI7/X1r2b/xpN5WzONiOVbD6qgcgPoPElVlGMwBccpO
	yJKZBg3WBm6EYprMfJOig5CG3BJV1lAA9d5fH3ab7fkmV+aB/vD5+sxKeRPsz/P8fcdL8M
	6dFVrh7z4FPoTNE/iLehcls/hS7UTVw=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-648-mn46SPf1NXGrxaW4AoHaSQ-1; Mon,
 20 Jan 2025 08:44:43 -0500
X-MC-Unique: mn46SPf1NXGrxaW4AoHaSQ-1
X-Mimecast-MFC-AGG-ID: mn46SPf1NXGrxaW4AoHaSQ
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BFAF41956070;
	Mon, 20 Jan 2025 13:44:40 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.225.104])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id E98B319560BF;
	Mon, 20 Jan 2025 13:44:35 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Mon, 20 Jan 2025 14:44:15 +0100 (CET)
Date: Mon, 20 Jan 2025 14:44:09 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Kees Cook <kees@kernel.org>, Andy Lutomirski <luto@amacapital.net>,
	Will Drewry <wad@chromium.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 0/4] seccomp: remove the 'sd' argument from
 __secure_computing()
Message-ID: <20250120134409.GA21241@redhat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

Hello,

I know nothing about arch/mips and I don't have a mips machine, 1/4 wasn't
even compile tested.

Oleg.
---

 arch/mips/kernel/ptrace.c           | 20 ++------------------
 arch/powerpc/kernel/ptrace/ptrace.c |  2 +-
 include/linux/seccomp.h             | 12 ++++--------
 kernel/entry/common.c               |  2 +-
 kernel/seccomp.c                    | 26 ++++++++++----------------
 5 files changed, 18 insertions(+), 44 deletions(-)


