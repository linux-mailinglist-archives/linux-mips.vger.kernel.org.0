Return-Path: <linux-mips+bounces-3667-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5D6907BDB
	for <lists+linux-mips@lfdr.de>; Thu, 13 Jun 2024 20:59:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A0F721C24AA6
	for <lists+linux-mips@lfdr.de>; Thu, 13 Jun 2024 18:59:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17DE614B940;
	Thu, 13 Jun 2024 18:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XZSIWvof"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C5C1EA87;
	Thu, 13 Jun 2024 18:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718305144; cv=none; b=WgWy5xJApPAhSj0zH2n8WwGN8UTsmRpS9MMcyR+6CrY18k0mIDPLE0IsyAUuSm/lODATL1EfrzuNVdj/wZuXlPPIe/DyuGrv/yqZ7tjJun99Q0KeoxJt0f7A60ODv57nduAQ1UGUcn5aD+WmgITKkOjtGG1e/vfOXC2/X2+UDQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718305144; c=relaxed/simple;
	bh=1wZDetFIs02rqR+GmvHPoOlvYd2a6bwC1F98ci2p6v0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QOxmdPLJqg1bZ7ze4UWFkgHBm84WDbTO/qV603ynWBrfhHhRNBQ5ROoRkZUCqWHsCgJyE9n1i9eERZ4VrztfpEBLE5Q8dkILq055WthcDEi6uk4r7DVQCOI0UidHec8D6qApgpxdXa5VHRjJk8hbyI9qyKrJAWSOKvQisrdlA8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XZSIWvof; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26BA2C2BBFC;
	Thu, 13 Jun 2024 18:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718305143;
	bh=1wZDetFIs02rqR+GmvHPoOlvYd2a6bwC1F98ci2p6v0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XZSIWvoftyK3T7NdyBJ8Up0n50azQEPm+PR70V6+1aDz4zdacw8igDMgSPZpZzi0+
	 SJ5+k4AdP72n2MNQ7b3nNJzkxIfwu3sKBY6l2+AmfDf5vSQ5HDN15HikyJwUB2VqZ7
	 P3yEj7wCUkCBwyPoordb4GdLZ64cSi852gJjdVdjZnNqp49xuLYFsXa2CYuXrthx0P
	 zIhXm8pyboMkwoTEzghcFRbseXOFXTUZuewU2Ri8B8Atu/Gjsg0V9W0GDosOpBRK/G
	 18Y1FFIbrbtCdvbN6T+eMhZSXYLKqRnsm+CQCZoYCbgKGBMB35ZXTPwoFVGeqTxm7A
	 nrXtCu0vo+dog==
Date: Thu, 13 Jun 2024 12:59:02 -0600
From: Rob Herring <robh@kernel.org>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Conor Dooley <conor@kernel.org>, Lee Jones <lee@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"paulburton@kernel.org" <paulburton@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH v2 7/8] du-bindings: mips: cpu: Add img,mips compatible
Message-ID: <20240613185902.GB2286020-robh@kernel.org>
References: <20240612-boston-syscon-v2-0-9f8e1a07fa63@flygoat.com>
 <20240612-boston-syscon-v2-7-9f8e1a07fa63@flygoat.com>
 <20240612-unstuffed-figure-966c90af52bc@spud>
 <ddb36d6c-b54f-4982-b9ca-48c022ce6eb8@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ddb36d6c-b54f-4982-b9ca-48c022ce6eb8@app.fastmail.com>

On Wed, Jun 12, 2024 at 05:59:24PM +0100, Jiaxun Yang wrote:
> 
> 
> 在2024年6月12日六月 下午5:39，Conor Dooley写道：
> > On Wed, Jun 12, 2024 at 12:56:26PM +0100, Jiaxun Yang wrote:
> >> This compatible is used by boston.dts.
> >> 
> >> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> >> ---
> >> note: This is a wildcard compatible for all MIPS CPUs,
> >>       I think we should use something like "riscv" for riscv.
> >
> > riscv systems, other than simulators etc are not meant to use the
> > "riscv" compatible. All of the real CPUs use "vendor,cpu", "riscv".
> > I'd suggest you add specific compatibles for your CPUs.
> 
> Boston can be combined with many different CPUs, thus we need to have
> such compatibles.

Then you'll need different DTs. Different h/w, different DT.

No way we're taking a generic compatible like this.

Rob

