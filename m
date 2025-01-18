Return-Path: <linux-mips+bounces-7505-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C51A15DCF
	for <lists+linux-mips@lfdr.de>; Sat, 18 Jan 2025 16:53:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F03203A6B39
	for <lists+linux-mips@lfdr.de>; Sat, 18 Jan 2025 15:53:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11A7219C556;
	Sat, 18 Jan 2025 15:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BgCLiJuq"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5472273F9;
	Sat, 18 Jan 2025 15:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737215601; cv=none; b=KDp+lwQIcDbxq1osljBv2KvMHyM1angYspjEtlJf+/3mwce+MeG+0xkcaFF1PEILyrhJxO9WRLE8quNX86rd+sO5IucQwq9kJMZSmdI5fU/zWCZEmhO8LnHWFfBq6iSoioP7nBJcRgJTKEK/oGpsnwgpne+ZyVo+aAL6OxSMmd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737215601; c=relaxed/simple;
	bh=C/HChh+xDedWrorJWwzQh4N0JeP+N/Ib4HhWl3trnYs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SJQWWfzQxXvWvdIetWKSP1AaGjUE51aWBLOnTGWIqbiwkk/wr11hzY47xXw7puOu+FHBSmGt4ff/0CUFMEL5MaTikQHkwCwzeSdOCuEpQ73+xPLTKX1j+Ewr8ntW+eO/tjob69cLZOrwqJgKlajdIpgs/XvAakYKpwhrNgjIvuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BgCLiJuq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB58BC4CED1;
	Sat, 18 Jan 2025 15:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737215600;
	bh=C/HChh+xDedWrorJWwzQh4N0JeP+N/Ib4HhWl3trnYs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BgCLiJuqioyb83lzj1TfHnGcn7ufgUqMfQY12nBQ5gvEuFS1+3iGlx4ws8JT147T8
	 Y92mXE1cx89hjhbNwsHsnWgMyXUHprQGFESR9eRZb3ej+u/wBPIYfpb3ZEgE+FydJ9
	 TFpjCCh97YpusCB4cIpoTzqMs05ZFRzG55DryX9Ns4nRwvSexgE0al7S/lVeD5CzKX
	 wnkY2DEZYx40ErHlak385lqojV/ZGokffZpQzw1yLR/LxZI+vs57D8ks8AORsv4BAv
	 gIJmmB+zP/CaFUv+/Tcug7vf4TZM+ehjBNdMdoNd/zpkk62cQhEJpJyyJExlth4D0g
	 z10IrNWTBOD0A==
Date: Sat, 18 Jan 2025 16:53:17 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Keguang Zhang <keguang.zhang@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-mips@vger.kernel.org, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] ASoC: dt-bindings: Add Loongson-1 AC97 Controller
Message-ID: <20250118-maroon-nightingale-of-tranquility-2ae1ce@krzk-bin>
References: <20250115-loongson1-ac97-v1-0-2087b04dcd7f@gmail.com>
 <20250115-loongson1-ac97-v1-1-2087b04dcd7f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250115-loongson1-ac97-v1-1-2087b04dcd7f@gmail.com>

On Wed, Jan 15, 2025 at 07:03:07PM +0800, Keguang Zhang wrote:
> Add devicetree binding document for Loongson-1 AC97 controller.
> 
> Signed-off-by: Keguang Zhang <keguang.zhang@gmail.com>
> ---
>  .../bindings/sound/loongson,ls1b-ac97.yaml         | 68 ++++++++++++++++++++++
>  1 file changed, 68 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof


