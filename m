Return-Path: <linux-mips+bounces-7550-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD889A16DB0
	for <lists+linux-mips@lfdr.de>; Mon, 20 Jan 2025 14:46:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 936353A8468
	for <lists+linux-mips@lfdr.de>; Mon, 20 Jan 2025 13:45:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 691401E22FB;
	Mon, 20 Jan 2025 13:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TMl9eJqH"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B980D193
	for <linux-mips@vger.kernel.org>; Mon, 20 Jan 2025 13:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737380732; cv=none; b=mW1wb1wFXDdgrW9eg1Z5mqT1HhnHpKqY4i3IfmSV72JUSvviOKsghxu3XXCfMDhVtBOfggWOPGdSF+RmAc3IQtZMPzs55KgIEoL9lcZyj8tv+xTtcUWqlY2bFDwmqr4DT2VScjjqm1/O+OCt4s9AzSALX2p0FtmpV0QRs7ww+oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737380732; c=relaxed/simple;
	bh=XjFHIjesQ/Y9YCfSXrcZR/HEGaOC+Ql0rDoc48ACBmw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=m+hLl+tNsm0AWqmhQ/fzP1vrMW57CGRamQJNP6fAPerEDuoIsopwjuaMQFAESZe2MlnsEzFAR9OURjGmOgpbY9XwceuSwcgNfEAKxHfuZXN2l1j2DfhX1m6wQVXU8U3+is0rc8cIui1A1UI1zYfo5WSDXawWnCq6cJ05p/jAddY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TMl9eJqH; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737380729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to; bh=NuY4lntt+wpPMOwlY29nGQdQknJ504nvEIdtakSNjH8=;
	b=TMl9eJqHt35pUJ3MMZPj2yK/o71x8wtsczC4QgB1kjv/llTXuxWhHVx5t3CxL1thu8hZ8S
	OD9c/iD1xGgZOHX/lVfcJGnqpkGP44j9W45hLRsHe/NgnA/d3Naqt5HoFu/KX3w2cNEFlY
	BG14niu1GthmVVMcdyCjW0YmjLZ3Jto=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-94-2ZKrlAgyONWB5VKEmnE0Sw-1; Mon,
 20 Jan 2025 08:45:26 -0500
X-MC-Unique: 2ZKrlAgyONWB5VKEmnE0Sw-1
X-Mimecast-MFC-AGG-ID: 2ZKrlAgyONWB5VKEmnE0Sw
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DA6541956062;
	Mon, 20 Jan 2025 13:45:23 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.225.104])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 4222619560A3;
	Mon, 20 Jan 2025 13:45:18 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Mon, 20 Jan 2025 14:44:58 +0100 (CET)
Date: Mon, 20 Jan 2025 14:44:52 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Kees Cook <kees@kernel.org>, Andy Lutomirski <luto@amacapital.net>,
	Will Drewry <wad@chromium.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/4] seccomp: kill the dead code in the
 !CONFIG_HAVE_ARCH_SECCOMP_FILTER version of __secure_computing()
Message-ID: <20250120134452.GA21275@redhat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250120134409.GA21241@redhat.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Depending on CONFIG_HAVE_ARCH_SECCOMP_FILTER, __secure_computing(NULL)
will crash or not, this is not consistent/safe.

Fortunately, if CONFIG_HAVE_ARCH_SECCOMP_FILTER=n, __secure_computing()
has no callers, these architectures use secure_computing_strict().

Also, after the previous change __secure_computing(sd) is always called
with sd == NULL, so it is clear that we can remove the code which makes
no sense.

Signed-off-by: Oleg Nesterov <oleg@redhat.com>
---
 include/linux/seccomp.h | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/include/linux/seccomp.h b/include/linux/seccomp.h
index e45531455d3b..e01dfe57a884 100644
--- a/include/linux/seccomp.h
+++ b/include/linux/seccomp.h
@@ -32,11 +32,7 @@ static inline int secure_computing(void)
 }
 #else
 extern void secure_computing_strict(int this_syscall);
-static inline int __secure_computing(const struct seccomp_data *sd)
-{
-	secure_computing_strict(sd->nr);
-	return 0;
-}
+static inline int __secure_computing(const struct seccomp_data *sd) { return 0; }
 #endif
 
 extern long prctl_get_seccomp(void);
-- 
2.25.1.362.g51ebf55


