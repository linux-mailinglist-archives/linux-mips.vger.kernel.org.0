Return-Path: <linux-mips+bounces-7826-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 63238A3A08C
	for <lists+linux-mips@lfdr.de>; Tue, 18 Feb 2025 15:56:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B696D18865BC
	for <lists+linux-mips@lfdr.de>; Tue, 18 Feb 2025 14:55:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C99E26AA8E;
	Tue, 18 Feb 2025 14:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MD+0QgKC"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00AE269B09;
	Tue, 18 Feb 2025 14:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739890547; cv=none; b=KqW7WaUuPSxGQeLLcH6+jZVL9vLFtIsJWaJMPO1a6oqWYlP6Acw69BCf0Rumuy6CYDJDAqMgc7YGMzHv+kmRTkRGxwWZ4aJ1BiqcqA/fZH++5lWJMpT0epvcmnV7mmVg/CwwOhYy59goHFpky1uFrvcINR+up24e1lPl6lumYQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739890547; c=relaxed/simple;
	bh=/V5shWYAkK7wZryKPoRAfySkogLDBURQNFw7pVIC40M=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m/IvLFagxxIb5cObyEcaVjVTbvTcoAAa5hOLfzCVkH7sUuXoYC9w/E/ApBKT3s/55N2B9x550XrFhRD2ouxFa0RlU15Svcdwc1Xj8A6bNeU6k4HcrJayjposUdoKEoOh1bsj9TcMZmVgQnQcHz1mW/xROOfDXL40Hnd3HnxZ5yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MD+0QgKC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8022C4CEE2;
	Tue, 18 Feb 2025 14:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739890547;
	bh=/V5shWYAkK7wZryKPoRAfySkogLDBURQNFw7pVIC40M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=MD+0QgKCaE0dGGJzjvw3Nvb68g0GeZDCzKqF3DTO6u3ZQ27KW7U7xt5k/cOAHvm8z
	 NowOSj7jgQVVJ9vkAQo2vxQ+jFFlexsjmmtnKF8gDgjFjZMMgzTeTBR++0Ptw2rFTY
	 IUjyLPW8Y0KcXnqxk0Jf0OFDeKIQI2DhKqkOF1eJQlHrG445GDXhOk8KvanQcbkAm1
	 PsCnr67qTT2fpJAfMnb9DUlFQiZCuQ0mEeTuNINZY5HoG6JmRiF54vblHRl2w99SKH
	 +C45fmu0vgGkY2a+gnh9FbDoL4QY5IeZluSgN1HfxGPvigDeQ60nrO3XI3iCGjixaJ
	 q0qEjtE9c/SYQ==
Date: Tue, 18 Feb 2025 06:55:45 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 lee@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, tsbogend@alpha.franken.de,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-mips@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH net-next 0/5] dt-bindings: net: realtek,rtl9301-switch
Message-ID: <20250218065545.533bab5f@kernel.org>
In-Reply-To: <20250214134528.4630b6b2@kernel.org>
References: <20250209234751.460404-1-chris.packham@alliedtelesis.co.nz>
	<20250214134528.4630b6b2@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 14 Feb 2025 13:45:28 -0800 Jakub Kicinski wrote:
> On Mon, 10 Feb 2025 12:47:46 +1300 Chris Packham wrote:
> >   dt-bindings: net: Move realtek,rtl9301-switch to net
> >   dt-bindings: net: Add switch ports and interrupts to RTL9300
> >   dt-bindings: net: Add Realtek MDIO controller  
> 
> AFAIU we're waiting for a review from DT maintainers on this one,
> is this series on your radar?

Not sure why we're getting no reviews here.
Chris, could you repost? Maybe we'll get this back into people's review
queues that way..
-- 
pw-bot: defer

