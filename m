Return-Path: <linux-mips+bounces-3296-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3581D8C9214
	for <lists+linux-mips@lfdr.de>; Sat, 18 May 2024 21:26:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E2951C215DD
	for <lists+linux-mips@lfdr.de>; Sat, 18 May 2024 19:26:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBC0B3A1B5;
	Sat, 18 May 2024 19:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FGnlxQVS"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBFAD6A33E;
	Sat, 18 May 2024 19:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716060375; cv=none; b=XQP5WJML2UqZPTK5JyiWMky18thdUXjPWG1gFbrD4ShpQen6ZaoZgjK/nIfwKqmTBpeQgB7B4N6xc5bhYAZRI6sC6phX1O4MbHyDOdv7u0WRowYNx8WTZj29wFlZdkGJONEXgsCMkkYIQe0L2xLRalG1jyvFcGtkGxn5fzb8m0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716060375; c=relaxed/simple;
	bh=pS7/FQKAboSjZ4dU+UOgLuhCwuMawr64gb0JWqrROIQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tmpCPvvXK4aVBRO+/31CfwMZyt5l85KPUu5tODOfHWRBLaGYN/rQ+OxUKtGJNLAijtxVHVUTzg8JDjKVTCz/rGik5+q9auy72qwsbGnNIGk9T7CA2vywvIZWBaxvrMeqLcAgIvfvdzbSnOs7YuTsvGGtY6RnsAmItKle8cEqGuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FGnlxQVS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73AD9C113CC;
	Sat, 18 May 2024 19:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716060375;
	bh=pS7/FQKAboSjZ4dU+UOgLuhCwuMawr64gb0JWqrROIQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FGnlxQVSLyGfCh1HpdC3bZZOPEuzKKBdWozEWgsTmwrcyTMKl5Ue4qdREsC9SUTpK
	 OyO7ymdSgCjqp+7h0emx8YFLY7htd9JTxSsj6ImCQAlCLMZTbjTkAIiZsN0MXyTNgA
	 mfmynlRTkIf9bJKoMwl17eNNi6xSo2e+RfLU/MwpL3mciYefllRTgVENchg5tkyATA
	 p6PB7CtBOJBfnNG0Zv8h5/Dni25TtcH4lvv1u65nhHBPHQr5Pcln4VgY+TjuXLuhlo
	 +m5+iZNlb4BQ86AndXenc7as14rxqmvbYKi56K6rFsRV0O+hwALojnbuzaHjDo9kae
	 VnhAD0zc1mMXw==
Message-ID: <418f3270-553b-4b01-b906-2855956b2b4e@kernel.org>
Date: Sat, 18 May 2024 21:26:08 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: mfd: syscon: Add
 img,boston-platform-regs
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 "paulburton@kernel.org" <paulburton@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
References: <20240513-boston-syscon-v1-0-93ff557d3548@flygoat.com>
 <20240513-boston-syscon-v1-1-93ff557d3548@flygoat.com>
 <c7317ea0-fcd6-40e0-9d90-bb1ff349c0e0@kernel.org>
 <31769e8d-ab52-4f4c-84ca-2f546287d006@kernel.org>
 <61445fe0-9137-44a6-ab36-ffb8985254df@app.fastmail.com>
 <2245e750-0b5d-49d1-88f3-7c1c75f275e7@kernel.org>
 <2aec4e38-f596-47d7-9e2a-a99e628dff5a@app.fastmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <2aec4e38-f596-47d7-9e2a-a99e628dff5a@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/05/2024 12:15, Jiaxun Yang wrote:
>>>
>>> Do you mind telling dumb as me how to test bindings properly?
>>>
>>> I tried to run make check_dtbs after applying this patch and that's all
>>> the warnings I got:
>>> ```
>>> arch/mips/boot/dts/img/boston.dtb: Warning (interrupt_map): Failed prerequisite 'interrupt_provider'
>>> /home/flygoat/linux-next/arch/mips/boot/dts/img/boston.dtb: /: 'model' is a required property
>>>         from schema $id: http://devicetree.org/schemas/root-node.yaml#
>>> arch/mips/boot/dts/img/boston.dtb: /: failed to match any schema with compatible: ['img,boston']
>>> arch/mips/boot/dts/img/boston.dtb: /cpus/cpu@0: failed to match any schema with compatible: ['img,mips']
>>> arch/mips/boot/dts/img/boston.dtb: /system-controller@17ffd000/clock: failed to match any schema with compatible: ['img,boston-clock']
>>> /home/flygoat/linux-next/arch/mips/boot/dts/img/boston.dtb: uart@17ffe000: $nodename:0: 'uart@17ffe000' does not match '^serial(@.*)?$'
>>>         from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>>> ```
>>>
>>> I think there is no new warning introduced by this patch.
>>> Did I miss anything here?
>>
>> Indeed there might be no warning for this, because syscon allows a lot,
>> including children. You need custom binding anyway.
> 
> Hi Krzysztof,
> 
> I really don't understand the reason behind having a custom binding for
> such device. It even doesn't have a driver and purely rely on generic
> syscon regmap to work.
> 
> I can see devices like mediatek,mt8365-syscfg being described by simple
> binding have a similar nature, they all describe a register bank and with
> serval sub nodes to describe devices being instanced under that register
> block.
> 
> What makes img,boston-platform-regs special here?

Nothing is special here, I am in writing a patchset which will fix this
up and all will be treated similarly.

Bindings for devices should be specific, which then allows to see that
you do not have dependency of children on the parent, and your current
patch allows basically anything as a child. It allows also an
dependency, even if you did not code it.

Best regards,
Krzysztof


