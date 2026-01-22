Return-Path: <linux-mips+bounces-12985-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mDx2D7aycmnwogAAu9opvQ
	(envelope-from <linux-mips+bounces-12985-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 23 Jan 2026 00:28:54 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5B86E7DC
	for <lists+linux-mips@lfdr.de>; Fri, 23 Jan 2026 00:28:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0D0BD3001A78
	for <lists+linux-mips@lfdr.de>; Thu, 22 Jan 2026 23:28:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52D69346AD5;
	Thu, 22 Jan 2026 23:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="gZQ8voLN"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7BEC3DB756;
	Thu, 22 Jan 2026 23:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769124526; cv=none; b=csmeMdYAXuKiNymnBavY07vG16HNYTNzy5ryB/XTG4RYEC23nqlfaQ1z52p0xDOn3NbigS5fNnJpJxTAu5Tdtk/7BnLPHl6+SD/Yxisv5Vm0n9OqWrG07cXPCl2uVejYJE6amU9udsrQ/qXXCYVV+biRKETH15X/yRVPEdKfkP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769124526; c=relaxed/simple;
	bh=1rzoRxjBxb4BG5/p6nEiarc5sjUoR+CCCJcWpX6xZBU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NEHnwZyX34BCr1Oajj8qgsyV+i6h3PI7+z3XdZmOn17OLVvoZjCjnJjH3U/pLGcmxrHArMY6BTDIMieaztaptHnacEy3chf5OFFJ8QW3Xz+ABjvw9/6zunwn5cq1KsUoSx0Px4IKbHkXyFOje07+SCnGb6xwChlLcL1pR5h8Gs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b=gZQ8voLN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21401C116C6;
	Thu, 22 Jan 2026 23:28:42 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="gZQ8voLN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1769124520;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kAz0VE0aOXkTcnMsKZPcPLkEBbWRFSQ9zoUsrO3JsFA=;
	b=gZQ8voLNqP2wWMPrgAFFPQqM3dQtnQELPH8RWkZqlFaRd3tnhApMvte4sd3nU0Ql3XOzkx
	r7O/0h1mHbk5Z3LpYrJJT2rTcscRugiMW5k6hm1nduek7IWmiVHOrg8UD9fwD1yWt9p+cc
	JKaaRYWQ9EN9tFsCeDd2mcNJ+9jcJjQ=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 325b9127 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Thu, 22 Jan 2026 23:28:39 +0000 (UTC)
Date: Fri, 23 Jan 2026 00:28:32 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Russell King <linux@armlinux.org.uk>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Theodore Ts'o <tytso@mit.edu>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org
Subject: Re: [PATCH 09/15] random: vDSO: Add explicit includes
Message-ID: <aXKyoETSE7G4PqmE@zx2c4.com>
References: <20260114-vdso-header-cleanups-v1-0-803b80ee97b4@linutronix.de>
 <20260114-vdso-header-cleanups-v1-9-803b80ee97b4@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260114-vdso-header-cleanups-v1-9-803b80ee97b4@linutronix.de>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[zx2c4.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[zx2c4.com:s=20210105];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[arm.com,kernel.org,armlinux.org.uk,linux.ibm.com,ellerman.id.au,gmail.com,xen0n.name,alpha.franken.de,mit.edu,lists.infradead.org,vger.kernel.org,lists.ozlabs.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-12985-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[zx2c4.com:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Jason@zx2c4.com,linux-mips@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.973];
	TAGGED_RCPT(0.00)[linux-mips];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5C5B86E7DC
X-Rspamd-Action: no action

On Wed, Jan 14, 2026 at 09:01:41AM +0100, Thomas Weißschuh wrote:
> Various used symbols are only visible through transitive includes.
> These transitive includes are about to go away.
> 
> Explicitly include the necessary headers.

Please lowercase the subject line. Otherwise,

Acked-by: Jason A. Donenfeld <Jason@zx2c4.com>

