Return-Path: <linux-mips+bounces-12934-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C0CD213EF
	for <lists+linux-mips@lfdr.de>; Wed, 14 Jan 2026 21:58:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C5696301EA23
	for <lists+linux-mips@lfdr.de>; Wed, 14 Jan 2026 20:58:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38D6A357A39;
	Wed, 14 Jan 2026 20:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SCcvHs7d"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 126842F25F3;
	Wed, 14 Jan 2026 20:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768424337; cv=none; b=J6sYqK/wr50BI2883dpCL6rvAkzWaxePXkAaXkKS5l0fn+e/E2qaXf3Y3YAfE/UD6DJDd5ObzSTOwuD638+je8UrjgG5mS1LgWWYWFCyQprkzQmqmEeCRS1NteSRlZ/j//1QggcEqWO/g/bUM5XqLGzVpQhki46/hf0MHyJuXmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768424337; c=relaxed/simple;
	bh=t15mgHwN+WGpwIYDNelTtRTVGa0I3MDtGvlcDLcbvYY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SSx7EEvYv/8+DULftnhv/pYV6/x4yo2y4PExe0fPreAvfgdOrjI6iGx7EEurGMS2bVj/uSTGrmD+Yconfzg0IHxV9V2/fDdmuroWt0CNOJkqz7VGn17xBDC1XWaTVF383kQyNSu6OjXiCe773a8WAG/OEiabfpOrnqZ0IegeKRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SCcvHs7d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 852BEC4CEF7;
	Wed, 14 Jan 2026 20:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768424336;
	bh=t15mgHwN+WGpwIYDNelTtRTVGa0I3MDtGvlcDLcbvYY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SCcvHs7dfJFVxcq4dLHWL6gXUCCRWKtNiONjkzm/PR+KtBnxQlLSt1vJe3/CtfXRC
	 6SaMBDntB34hDv1r+JdiAEb40VnpctKNWoW8bEjRO7I8Qiq1b24XtV2TprW+/f5kfR
	 BcdhgHmi0dM6njT1NLDuxb53WSetxHmjUsJdUC7Ws/3HVEv7W0CyswhtXo8JamHYFw
	 DXY8CMnAZ1Jo+uPvJ4pkrvFES59VrDwCAwGngHPjvF9UMRnqk+coXC7W1fU09bjgs6
	 /m255OisvcgKH1GbuzzEMEfkRz+w3cCW+q+HKlRWrJWDZ5B+mA4E16mKOFEdoL02yx
	 05I6Onq2/LF+Q==
Date: Wed, 14 Jan 2026 14:58:55 -0600
From: Rob Herring <robh@kernel.org>
To: Binbin Zhou <zhoubb.aaron@gmail.com>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org,
	Xiaochuang Mao <maoxiaochuan@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev,
	devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
	Keguang Zhang <keguang.zhang@gmail.com>
Subject: Re: [PATCH v2 2/3] dt-binding: rtc: loongson: Document
 Loongson-2K0300 compatible
Message-ID: <20260114205855.GA3190839-robh@kernel.org>
References: <cover.1767663073.git.zhoubinbin@loongson.cn>
 <8876bebaf08121bb5edd2500f5289284b75df011.1767663073.git.zhoubinbin@loongson.cn>
 <20260106191314.GA2568583-robh@kernel.org>
 <CAMpQs4LpKSLGKySmzHeysS3x78inUQy9DF4dShneNymDvAi4Ew@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMpQs4LpKSLGKySmzHeysS3x78inUQy9DF4dShneNymDvAi4Ew@mail.gmail.com>

On Wed, Jan 07, 2026 at 09:22:41AM +0800, Binbin Zhou wrote:
> Hi Rob:
> 
> Thanks for your review.
> 
> On Wed, Jan 7, 2026 at 3:13 AM Rob Herring <robh@kernel.org> wrote:
> >
> > On Tue, Jan 06, 2026 at 09:33:32AM +0800, Binbin Zhou wrote:
> > > Add "loongson,ls2k0300-rtc" dedicated compatible to represent the RTC
> > > interface of the Loongson-2K0300 chip.
> > >
> > > Its hardware design is similar to that of the Loongson-1B, but it does
> > > not support the alarm feature.
> >
> > But you are requiring the interrupt property for it? Isn't it no alarm
> > feature means no interrupt?
> 
> Yes, the `interrupts` attribute is not required without the alarm feature.
> 
> But my judgment condition is `not contains` (added in patch-1[1]).
> There are only a few SoCs on the Loongson platform that don't support
> the RTC alarm feature, so I think `not contains` looks cleaner and
> simpler.

I should have said allowing rather than requiring.

You are allowing (though not requiring) 'interrupts' for Loongson-1B and 
Loongson-2K0300. In patch 1, you made it required for other platforms 
which is an ABI change. That's fine if it was a mistake and is truly 
required.

Rob

