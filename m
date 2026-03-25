Return-Path: <linux-mips+bounces-13937-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ABMPOOfbw2lwuQQAu9opvQ
	(envelope-from <linux-mips+bounces-13937-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 25 Mar 2026 13:58:15 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB273254E3
	for <lists+linux-mips@lfdr.de>; Wed, 25 Mar 2026 13:58:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 477E930A9B30
	for <lists+linux-mips@lfdr.de>; Wed, 25 Mar 2026 12:48:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C0AF3D6483;
	Wed, 25 Mar 2026 12:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="cg24GlqA"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9E53D6479;
	Wed, 25 Mar 2026 12:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774442925; cv=none; b=RImIKKp44c5PJODzVhShag3N3OAzCxQw5sTnvNsQXm3Subn+8hKe+rFAZU38lsmV8ebTUFl73MCucjB6Fs4tzPNQiPKZGAcJFKAb7gO+mt7cQQr1UZnieL/56cUxz5H6eeaCzi5bna8c5+VnJhoHFUrLfe/isuCXxas2xJDRERY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774442925; c=relaxed/simple;
	bh=P0Ni30xRg8QLMwvZ3OqGaYPQrCWuMnf4eu5qeZBTnTg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QzJH7LaZoWQKQxXRUCuqcjbBXvnTe4xlaXT73dDLbIITjC+xgOaxFa9Ha0mH8wGzM/Nqo5cCN5E7zKQMoFrm5V30/7fHO9oZpK1AOPv+DOC+0adcgDAa30soekGCk5UeuwUTVa8AFatxEBtj7s4g3NqrzBrKyBBuz9p8bSTDZb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=cg24GlqA; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3A50D4E4270B;
	Wed, 25 Mar 2026 12:48:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0C5CE601E2;
	Wed, 25 Mar 2026 12:48:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 38C7110451386;
	Wed, 25 Mar 2026 13:48:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774442914; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=vrUb56OKoILRudzSP2HC6iXbV4b/pdrYXylo4VOm6Ak=;
	b=cg24GlqAq71cIWMFccmLB7wrDVQ2wuWCHWIU+/af6+vNtyEkQQCG6DGEkUwuzkQnElrMZC
	cpS++ZFELbzorBzb0J085cw25rOBXyejUBnbeRjlJnMXAMRSCfZgAg7LbPn2nMVjanskG3
	a+BLte2WxI8w+RszzA933t1RjOXb7zlFAmbKdreK+zrXvUvZu4Hg6JgYyHL9FWtS57rKEj
	Yd4yP0zv+XH1dzA2wb0myTUcswAQg7Tz7xOU1WeRBMIKndT3aQ+v1mD8McvWePoYIDTzZ+
	PG1eDykT94b8yVmxt6VrlyzsffJf7dCvs7okzo9UvcAusXqn0rWEpc+doOILYg==
From: =?UTF-8?B?QmVub8OudA==?= Monin <benoit.monin@bootlin.com>
To: Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Conor Dooley <conor+dt@kernel.org>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 =?UTF-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>,
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
 Stephen Boyd <sboyd@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-mips@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Sari Khoury <sari.khoury@mobileye.com>, Brian Masney <bmasney@redhat.com>
Subject: Re: [PATCH v5 00/10] Add clock and reset support for Mobileye EyeQ7H
Date: Wed, 25 Mar 2026 13:48:28 +0100
Message-ID: <2786053.vuYhMxLoTh@benoit.monin>
In-Reply-To: <177431268711.5403.12519723172593766522@lazor>
References:
 <20260317-clk-eyeq7-v5-0-6f6daa2c2367@bootlin.com>
 <177431268711.5403.12519723172593766522@lazor>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-13937-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	DKIM_TRACE(0.00)[bootlin.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[benoit.monin@bootlin.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,bootlin.com:dkim,bootlin.com:url]
X-Rspamd-Queue-Id: 7DB273254E3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tuesday, 24 March 2026 at 01:38:07 CET, Stephen Boyd wrote:
> Quoting Beno=C3=AEt Monin (2026-03-17 06:33:02)
> > This patchset brings the support of the Other Logic Blocks (OLB)
> > found in the first Mobileye SoC based on the RISC-V architecture, the
> > EyeQ7H. Despite the change from MIPS to RISC-V, the Other Logic Blocks
> > provide similar clock and reset functions to the controllers of the
> > chip. This series introduces the device tree bindings of the SoC and
> > the necessary changes to the clock and reset eyeq drivers.
> >
> [...]
> >=20
> > This series depends on the EyeQ6Lplus support patchset posted
> > previously[1], which in turn depends on Th=C3=A9o's series[2]. In parti=
cular,
> > the changes made to the clk-eyeq driver in this patchset depend on the
> > changes done in these two series.
>=20
> Is it a build time dependency or a run time dependency? Are you
> expecting me to apply all three series to the clk tree?
>=20
It is a build dependency for the changes to the clk-eyeq driver. I am
trying to figure out the best merge strategy. I propose to split the
patches between the mips tree and the clock tree. The changes to the
clk-eyeq driver and the auxiliary pinctrl-eyeq5 and reset-eyeq drivers
could go through the clk tree. In detail, the following patches can
be applied in order to avoid merge conflicts and the series is fully
bisectable:

All the patches from Th=C3=A9o's series[1]:
        [PATCH v7 1/3] clk: eyeq: use the auxiliary device creation helper
        [PATCH v7 2/3] clk: eyeq: add EyeQ5 children auxiliary device for g=
eneric PHYs
        [PATCH v7 3/3] reset: eyeq: drop device_set_of_node_from_dev() done=
 by parent

The following patches from the eyeq6lplus series[2]:
        [PATCH v4 02/13] dt-bindings: soc: mobileye: Add EyeQ6Lplus OLB
        [PATCH v4 04/13] reset: eyeq: Add Mobileye EyeQ6Lplus OLB
        [PATCH v4 05/13] pinctrl: eyeq5: Use match data
        [PATCH v4 06/13] pinctrl: eyeq5: Add Mobileye EyeQ6Lplus OLB
        [PATCH v4 07/13] clk: eyeq: Skip post-divisor when computing PLL fr=
equency
        [PATCH v4 08/13] clk: eyeq: Adjust PLL accuracy computation
        [PATCH v4 09/13] clk: eyeq: Add Mobileye EyeQ6Lplus OLB

And the patches from this series:
        [PATCH v5 01/10] dt-bindings: soc: mobileye: Add EyeQ7H OLB
        [PATCH v5 02/10] reset: eyeq: Add EyeQ7H compatibles
        [PATCH v5 03/10] clk: fixed-factor: Rework initialization with pare=
nt clocks
        [PATCH v5 04/10] clk: fixed-factor: Export __clk_hw_register_fixed_=
factor()
        [PATCH v5 05/10] clk: eyeq: Prefix the PLL registers with the PLL t=
ype
        [PATCH v5 06/10] clk: eyeq: Introduce a generic clock type
        [PATCH v5 07/10] clk: eyeq: Convert clocks declaration to eqc_clock
        [PATCH v5 08/10] clk: eyeq: Drop PLL, dividers, and fixed factors s=
tructs
        [PATCH v5 09/10] clk: eyeq: Add EyeQ7H compatibles

The last patch to the MAINTAINERS file can be left aside for now, I can
include it in the series introducing the EyeQ7H SoC (not yet posted).


[1]: https://lore.kernel.org/lkml/20260225-macb-phy-v7-0-665bd8619d51@bootl=
in.com/=20
[2]: https://lore.kernel.org/all/20260316-eyeq6lplus-v4-0-bf44dfc7a261@boot=
lin.com/


Best regards,
=2D-=20
Beno=C3=AEt Monin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com




