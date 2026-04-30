Return-Path: <linux-mips+bounces-14399-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SCKYFntz82nQ2wEAu9opvQ
	(envelope-from <linux-mips+bounces-14399-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 30 Apr 2026 17:21:31 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5B34A4A03
	for <lists+linux-mips@lfdr.de>; Thu, 30 Apr 2026 17:21:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 21E8A309B1C9
	for <lists+linux-mips@lfdr.de>; Thu, 30 Apr 2026 15:13:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 352492E2DFB;
	Thu, 30 Apr 2026 15:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="iIZar/Vo"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A922B2D9EDC;
	Thu, 30 Apr 2026 15:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777561710; cv=none; b=slH9SKqYGc9G5AHKbB6Uk2M3pE9jCGwrZVELVMt+W1j8b9aEp4K3o055jwbKgYL8PJwd/e4LbtPNLP9jGMD29wGjd2tyXFZR6nDS4W0G8GLq1kUBtgoqBZgu8nZ+7CzpYWTfHFa3PqoeFhqMwkha9XSf8wt94tWuCVv/jUpKEeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777561710; c=relaxed/simple;
	bh=7d3HnHGgZrsz5f7NhhFbotRlYywQFuRKipkF36vvA50=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=W+VEjC/NIGvSTRNht6xe+XhILDaXXvEXz19lOy5dpzXPbzhX81q0UBjW0Z5cDwP19qM+RLbIYbNNc+ESTtPKZ5O/sknba3SqbfVxUePL0hf7/FOu4Qs3jd5DjvREu5M/J0RiDzY50P/Sbc6stQ4r9xz2YBohkZKBxTpRILHDzYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=iIZar/Vo; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0A09926C74A;
	Thu, 30 Apr 2026 17:08:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1777561700; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=x/I4FQy4U6VhMNoOlX/T5kktWf0A6jZB2RiC6246P2U=;
	b=iIZar/VoOQxbOIcwjnl92BFLNnfA0P6OKHRUSvH3nhWhqg5N3nZra1UAvdTPMWdqh+OnE7
	1RdwUBEfZjNBQnNWMIhE5HHR1kB2JDAWvJO/yTtNlTeNKlOC8C4wxRit1WjbNGQQM9z+TU
	Nw9fgQQN7eYGiORPliMmq2TSOoOuYRBayOZSMQ1p+BCcOG06UEbtyPo1td1ZKK/gmA1rWy
	yFnNb/TNWEnLk5B/MWPFltO1Fso8ke0k2W6FI5lAwXdnEpLOuOU0IWnpTPBNsTqnk0XyGQ
	PS+LOt1SVCizRQLl/zvGejWPukA0eh3MU8SMPZdZIIKGGa2dsQs7WnC4Jf5BbA==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: linux-mips@vger.kernel.org
Cc: tglx@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Caleb James DeLisle <cjd@cjdns.fr>
Subject: [PATCH v2 0/2] irqchip/econet-en751221: Support MIPS 34Kc VEIC mode
Date: Thu, 30 Apr 2026 15:08:07 +0000
Message-Id: <20260430150809.1827881-1-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: AE5B34A4A03
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[cjdns.fr,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[cjdns.fr:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14399-lists,linux-mips=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[cjdns.fr:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cjd@cjdns.fr,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,cjdns.fr:dkim,cjdns.fr:mid]

MIPS 34Kc and 1004Kc have a Vectored External Interrupt mode, where
CPU interrupts are re-routed to the external interrupt controller,
which prioritizes them, renumbers them, and integrates them with its
own, creating a flat interrupt table.

This bypasses the CPU interrupt controller entirely, which is not ideal
for modern Linux which formalizes the interrupt hierarchy. The 1004Kc
standardized the interrupt controller (MIPS_GIC) so it can be viewed as
"part of the CPU" and it's tolerable for it to be more closely coupled
to arch/mips/* than a typical interrupt controller driver.

The 34Kc supports VEIC mode, but the interrupt controller is not
standardized, so it's different per-SoC. This creates a challenge of
writing a reasonably modular driver, given hardware that actually does
take over the interrupt hierarchy.

Ordinarily we wouldn't bother with VEIC on the 34Kc but it is required
for MIPS_MT_SMP, so without it you get a single thread processor. The
only other 34Kc device which has an in-tree DTS file is
realtek,rtl9302-soc, in OpenWrt there is this, realtek,rtl839x-soc, and
lantiq,xway. Of these, the realtek,rtl839x-soc has multi-thread support
via an out-of-tree patch to its interrupt controller, and the lantiq
is not 34Kc compliant in that it lacks the VEIC cpu flag, causing linux
to fall back on legacy interrupts despite CPU_MIPSR2_IRQ_EI being set.

This patchset aims to tackle this challenge in a way that is most
likely generalizable to other 34Kc interrupt controllers which are
facing the same problem.

Changes from v1:
* Address notes from Thomas Gleixner (Thank you very much!)
* Additional info in cover letter regarding lantiq,xway
* v1: https://lore.kernel.org/linux-mips/20260425123531.270548-1-cjd@cjdns.fr/

Caleb James DeLisle (2):
  dt-bindings: interrupt-controller: econet: Add CPU interrupt mapping
  irqchip/econet-en751221: Support MIPS 34Kc VEIC mode

 .../econet,en751221-intc.yaml                 |  20 ++
 drivers/irqchip/irq-econet-en751221.c         | 176 +++++++++++++++++-
 2 files changed, 193 insertions(+), 3 deletions(-)


base-commit: e8be82c2d77ec1bb0148406e54b105028a83537e
-- 
2.39.5


