Return-Path: <linux-mips+bounces-13862-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ZchnM+/RvmlmeAMAu9opvQ
	(envelope-from <linux-mips+bounces-13862-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sat, 21 Mar 2026 18:14:23 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1802E6782
	for <lists+linux-mips@lfdr.de>; Sat, 21 Mar 2026 18:14:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 42CE830094CA
	for <lists+linux-mips@lfdr.de>; Sat, 21 Mar 2026 17:14:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 363E0329C78;
	Sat, 21 Mar 2026 17:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ekI7OpOs"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128842512DE;
	Sat, 21 Mar 2026 17:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774113260; cv=none; b=PsgG3R9FcUGixS87r5GpiJeK1LkXtKiuHCIx3Inid9vw11FeNzrP/KYINEMgz1bQHp/P09N9WWicRTv3do4rwTEy6qSQhCsIC+6FJohnwxldEhhbCrkTrRnbVGBwHm5HElXXr9yFkI0H15P1L/PVN4aomrvnnQnvTzhnH1/NbY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774113260; c=relaxed/simple;
	bh=UJMWvvJqdR1PYRby9qfnQtq6VQYLY8kw5EyYq0j5wBE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=RiFiMwN/nTVwDaxLNPgH3+XjoQGUglPr8K6NJ2zyCVn1ynF0G/0vE5HOli7/Py3B2IF5IvCmLLhEf5m4rZGCKZYAS7hz3dC/PGmiDKE1lCdepHtjzcszqyMbcmoZNS+vjjGkLlBzB+KhLAjRZ6Mykuqe0sHfsfLv9DCPM9cNj+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ekI7OpOs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9F5BC19421;
	Sat, 21 Mar 2026 17:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774113259;
	bh=UJMWvvJqdR1PYRby9qfnQtq6VQYLY8kw5EyYq0j5wBE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ekI7OpOsREtU9+uWbUP7OVozxIe1KjD3/kC/QpUEA0aWE0ZK66hNdeiaI9dZa7YA9
	 eKJCFrl3vwi8zCmlS6+vi15Z2gD0DkhqQw5BQ4ToPMRP6ejBWCxo0TyebvZ6f4/+cK
	 fLYanaoaXt56DTql+q95erFgv6FAJpFNFjhjc7iBh784emhLDAs8O2xXGLyK6Sqlrs
	 LTCCg4u/ctUmynTQmshMr9B9Ibswum/PPsvxofgwEsOoh2MSepMbJc9K78KTevOFDK
	 IYhkHIkigt3FLxx40LDot/Ke5txY5taTSCh8af4IgNMd2bxnmUNQyRzN5w3METS8XO
	 2BZlrCXVi289Q==
From: Thomas Gleixner <tglx@kernel.org>
To: Icenowy Zheng <uwu@icenowy.me>, Huacai Chen <chenhuacai@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Yao Zi <me@ziyao.cc>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org
Subject: Re: [PATCH v3 0/8] Add support for LS7A LPC IRQ for MIPS Loongson
 systems
In-Reply-To: <87f24e166c931d0040e7b838785e7b360cbc7c6a.camel@icenowy.me>
References: <20260314162828.1055188-1-zhengxingda@iscas.ac.cn>
 <CAAhV-H4OYVB21jH3PSzOi4GPU+t4LY664Yp=CeDhjFRKf9V07Q@mail.gmail.com>
 <87f24e166c931d0040e7b838785e7b360cbc7c6a.camel@icenowy.me>
Date: Sat, 21 Mar 2026 18:14:15 +0100
Message-ID: <87ikaphzq0.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13862-lists,linux-mips=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tglx@kernel.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4D1802E6782
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 21 2026 at 16:59, Icenowy Zheng wrote:
> =E5=9C=A8 2026-03-18=E4=B8=89=E7=9A=84 21:57 +0800=EF=BC=8CHuacai Chen=E5=
=86=99=E9=81=93=EF=BC=9A
> I'm going to change this for your preference, but please note that
> there's no requirement of using upper case for `summary phrase` in the
> Documentation/process/submitting-patches.rst document.

Interrupt chip code is maintained in the tip tree and that tree has a
supplementary document, which explicitely requests this:

  https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#patch-=
subject

