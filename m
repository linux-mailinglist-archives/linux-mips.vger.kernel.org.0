Return-Path: <linux-mips+bounces-13080-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WPDpMbJ8f2nMrwIAu9opvQ
	(envelope-from <linux-mips+bounces-13080-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sun, 01 Feb 2026 17:17:54 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBFDC6683
	for <lists+linux-mips@lfdr.de>; Sun, 01 Feb 2026 17:17:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4667D3001027
	for <lists+linux-mips@lfdr.de>; Sun,  1 Feb 2026 16:17:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88AED226D18;
	Sun,  1 Feb 2026 16:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DjF07Eoa"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662DBE54B;
	Sun,  1 Feb 2026 16:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769962671; cv=none; b=POto91JjjZxY1q+TK2M9lodyLOyoryTfvIZXY5OUhZyoqEWQptvTEcAH2vDrsFeJHj6s05+++Ankfk6fD7c7KmrpRkH+cxUy5dzhCudzPSpCM/B+T9zp3dZQ2GUMPSlHC2PJBEhGtua6iS20oXRgGmgaHfT+cYWET5P29IblrpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769962671; c=relaxed/simple;
	bh=MPcc02T66lUJdgbvMWTdA6hvB5xZOJb9WklCiPV+SW0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=keFeUVNMzZbK0B9ZYDdT+ZbGfZf+E6Nq/cXpxw8dTwQ9f65x5VbqkCr3Mk5pd9suwFr7Ecu+zircR4eX0W/ubE07LHpp7WF2eGo7el6sEuAxPPBm3Jl+M5wUIfRkqsQzzAPiW2lTaUHSLrHLhG6szTlXawvQurNkNRKph1mAIas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DjF07Eoa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EA41C4CEF7;
	Sun,  1 Feb 2026 16:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769962670;
	bh=MPcc02T66lUJdgbvMWTdA6hvB5xZOJb9WklCiPV+SW0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=DjF07Eoa2E7qVz65dYKHHvtpJmGMnpOlmxYtssmqBbdAGAP/0xevM++W0DIHX62Wh
	 Szw775DlhGCzFmHCfSleDZcerIqah9dZ4dOeUjsxIBsAiNU6S+OUYJ2+4nwQ/2iw05
	 ZO9+0fP10UrYZ7/rgelyFd+HiBLV1daFGhsWyvy6oB4bGSgQgMh6T9z3gj90V4+yvW
	 /9tIfYABwby3i5Go2yFwNncjbYcDLP154Pwnt8zZU8pX2erZl4fVIMP29mDrv1KJ4T
	 dZSDCs7CRis5PpCv9sjTW1Xbh2gIVNKB2V7FLPpFtsIKI8PKkYVeCZG5L5Jk0D/Kmw
	 NVpX4X9CrDjOA==
From: Thomas Gleixner <tglx@kernel.org>
To: Huacai Chen <chenhuacai@kernel.org>, Icenowy Zheng
 <zhengxingda@iscas.ac.cn>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mips@vger.kernel.org
Subject: Re: [PATCH 5/8] irqchip/loongson-pch-lpc: add OF init code
In-Reply-To: <CAAhV-H6VT0tE-rE+3YAm-Tjz4TKxqtaQmc4Medsw_0VQEW-W3A@mail.gmail.com>
References: <20260131094547.455916-1-zhengxingda@iscas.ac.cn>
 <20260131094547.455916-6-zhengxingda@iscas.ac.cn>
 <CAAhV-H6VT0tE-rE+3YAm-Tjz4TKxqtaQmc4Medsw_0VQEW-W3A@mail.gmail.com>
Date: Sun, 01 Feb 2026 17:17:46 +0100
Message-ID: <87y0lcfnf9.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13080-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tglx@kernel.org,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5DBFDC6683
X-Rspamd-Action: no action

On Sun, Feb 01 2026 at 10:33, Huacai Chen wrote:
> Hi, Icenowy,
>
> On Sat, Jan 31, 2026 at 5:46=E2=80=AFPM Icenowy Zheng <zhengxingda@iscas.=
ac.cn> wrote:
>>
>> As the (kernel-internally) OF-based MIPS Loongson-3 systems can also
>> have PCH LPC interrupt controller, add OF-based initialization code for
>> the driver.
> I think Patch-3/4/5 can be combined to a single one.

No. #3 should be separate, but #4/#5 combined. It's easier to review the co=
de
rework and the new code separately.

Thanks,

        tglx

