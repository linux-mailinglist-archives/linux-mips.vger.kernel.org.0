Return-Path: <linux-mips+bounces-6898-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A18579E698C
	for <lists+linux-mips@lfdr.de>; Fri,  6 Dec 2024 10:01:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 939A218822D3
	for <lists+linux-mips@lfdr.de>; Fri,  6 Dec 2024 09:01:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42B9E1EBFEF;
	Fri,  6 Dec 2024 09:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b="R5mcBZlk"
X-Original-To: linux-mips@vger.kernel.org
Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CEDB1E0E0A;
	Fri,  6 Dec 2024 09:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.208.246.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733475677; cv=none; b=LxnCbiEmVUPFSewstteTTzG4XZLys9nqFgELFDQsc9xf613DjG9Gn7Dt9AJ6fy5ZQj30k8tR1exdEFAZc6MDa7VvOH4EpkYpEvDY3QrWI1QWFD25c4OFfM4ZnkS0LF2DIrKdiB9YRFcFkjW6uC1EuwzX1VzoeoptjRNl1bXJsiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733475677; c=relaxed/simple;
	bh=1x0u9riat8kPFEsKvxvrEvzMJpAUfICf+XazPaTsegE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RdOtCLfq8BWADKNSRac8gmMhR0oPebj9jON+leJHr/2ZS+CiXiYBaZPr7I8vJg/8p8t0hYBFbTjoGY72Tq9QGRvZjIPaW2WiNDOdPpRtlQJGU0wG640jtYgk2P53bBOmCppAOQiz7jMTbYNIw9SD40HtouVfxs6FeiOInHeFUio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site; spf=pass smtp.mailfrom=xry111.site; dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b=R5mcBZlk; arc=none smtp.client-ip=89.208.246.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xry111.site
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1733475666;
	bh=X3geVufKFha8U2gEPNSOrBEm2am/RCbYcSR/VBvB+jY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=R5mcBZlk1kZb26zMgduE6ypCEPutYgoUQT9MC/hv6sjUmbqBZG8DItVI96CGxBzXM
	 rtWcMA+BxEwq5NJKC7hOD6ixGhasIuv4OSjvJ1EJDl5/IdcCU/LsxlbnEQzgddTjVR
	 J4QITIMOncl9SLkHzKHFWOx7wzKog74z997TfZLs=
Received: from [127.0.0.1] (unknown [IPv6:2001:470:683e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 44AE467033;
	Fri,  6 Dec 2024 04:01:04 -0500 (EST)
Message-ID: <1b73fbcfa3eab810d2e3e2ff886d2aa0991639f9.camel@xry111.site>
Subject: Re: [PATCH AUTOSEL 6.11 13/15] MIPS: Loongson64: DTS: Really fix
 PCIe port nodes for ls7a
From: Xi Ruoyao <xry111@xry111.site>
To: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, si.yanteng@linux.dev,
 davem@davemloft.net, 	jiaxun.yang@flygoat.com, devicetree@vger.kernel.org,
 linux-mips@vger.kernel.org
Date: Fri, 06 Dec 2024 17:01:02 +0800
In-Reply-To: <20241204221726.2247988-13-sashal@kernel.org>
References: <20241204221726.2247988-1-sashal@kernel.org>
	 <20241204221726.2247988-13-sashal@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2024-12-04 at 17:17 -0500, Sasha Levin wrote:
> From: Xi Ruoyao <xry111@xry111.site>
>=20
> [ Upstream commit 4fbd66d8254cedfd1218393f39d83b6c07a01917 ]
>=20
> Fix the dtc warnings:
>=20
> =C2=A0=C2=A0=C2=A0 arch/mips/boot/dts/loongson/ls7a-pch.dtsi:68.16-416.5:=
 Warning (interrupt_provider): /bus@10000000/pci@1a000000: '#interrupt-cell=
s' found, but node is not an interrupt provider
> =C2=A0=C2=A0=C2=A0 arch/mips/boot/dts/loongson/ls7a-pch.dtsi:68.16-416.5:=
 Warning (interrupt_provider): /bus@10000000/pci@1a000000: '#interrupt-cell=
s' found, but node is not an interrupt provider
> =C2=A0=C2=A0=C2=A0 arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb=
: Warning
> (interrupt_map): Failed prerequisite 'interrupt_provider'
>=20
> And a runtime warning introduced in commit 045b14ca5c36 ("of: WARN on
> deprecated #address-cells/#size-cells handling"):

Is it better to drop this part from the the commit message?  The
referred commit isn't in 6.11 or earlier.

> =C2=A0=C2=A0=C2=A0 WARNING: CPU: 0 PID: 1 at drivers/of/base.c:106 of_bus=
_n_addr_cells+0x9c/0xe0
> =C2=A0=C2=A0=C2=A0 Missing '#address-cells' in /bus@10000000/pci@1a000000=
/pci_bridge@9,0
>=20
> The fix is similar to commit d89a415ff8d5 ("MIPS: Loongson64: DTS: Fix PC=
Ie
> port nodes for ls7a"), which has fixed the issue for ls2k (despite its
> subject mentions ls7a).
>=20
> Signed-off-by: Xi Ruoyao <xry111@xry111.site>
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Signed-off-by: Sasha Levin <sashal@kernel.org>

/* snip */

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University

