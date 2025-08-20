Return-Path: <linux-mips+bounces-10394-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5CFFB2D610
	for <lists+linux-mips@lfdr.de>; Wed, 20 Aug 2025 10:20:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 901123A5914
	for <lists+linux-mips@lfdr.de>; Wed, 20 Aug 2025 08:17:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B90E5286D56;
	Wed, 20 Aug 2025 08:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="acLN5VJZ"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E17421B9FD;
	Wed, 20 Aug 2025 08:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755677839; cv=none; b=qJ5svji9nTarRkRGAZSsK5DMp3QzeHA+VhDRQLRVB+Mra0nCQL3tnQyly++woZPU4ujMXUm36Z4Ltfl/XF2njhe5ED+4z4BNoPHMJww78EBDnC/LuiDf+7NmOOrB9czv4JqkA7dS04USEnzZLnPOLImYI9Kb8fUvN0aRvhd60Cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755677839; c=relaxed/simple;
	bh=eeTD1WnJeeW0JDF4+n90rehCzOeXUQGxddIYv0rkDz0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=scBKSx6WS6LFrCKYel1KS1aaZ/++iJ5IGxNxCAwJ3qhmrMu485jZ7Q4squFf+aU5cGD8FdXIed7EQTW3aum4/hfXf62ZIunLH2HW+mGIhnh69cZzgPzgFESHdErJMEANP2yTRXxIM598TsY1KKucsg27ft7q0HvpHCvy8aB33KQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=acLN5VJZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1F54C4CEEB;
	Wed, 20 Aug 2025 08:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755677838;
	bh=eeTD1WnJeeW0JDF4+n90rehCzOeXUQGxddIYv0rkDz0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=acLN5VJZxiGjDymY3G2P4pFOPxtWunVq5RYG/ZCtq5nCGBif0dtptRZf8uilRPhwo
	 1JLV6LxiW85LWuaszAebdlMC0Bc9QODV11YrUgvyIqZO9ntC6lHZ6LuDshdIoQhazm
	 gq8O8AAsBNU0oPG1BRuHY3VwE91kthRyxpzW5yOG6A/7NNaWlmu2cAKUYsbnkte5+C
	 n+oqOYoiKJWQNIosZ5qcsyo8cb41sPG3iWCwjak0Ar4b3LXgaUKWuGRt0UksVegKjf
	 5t5kpFppM9XynTytAQZx3OJbqwV24XFLu8lh97vXEAh25BvKISmHr9YKvGTxkZccLO
	 OsjWYMj7PgkMw==
Date: Wed, 20 Aug 2025 10:17:15 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Aleksander Jan Bajkowski <olek2@wp.pl>
Cc: tsbogend@alpha.franken.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, john@phrozen.org, linux-mips@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: mips: lantiq: cgu: add name pattern
Message-ID: <20250820-rustling-festive-rabbit-b42fe2@kuoka>
References: <20250815141759.3408909-1-olek2@wp.pl>
 <20250815141759.3408909-2-olek2@wp.pl>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250815141759.3408909-2-olek2@wp.pl>

On Fri, Aug 15, 2025 at 04:17:41PM +0200, Aleksander Jan Bajkowski wrote:
> Lantiq target doesn't use Common clock Framework and requires strict
> node names. This patch adds the name pattern to the binding.

Same problems.

Best regards,
Krzysztof


