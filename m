Return-Path: <linux-mips+bounces-10395-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 722E0B2D606
	for <lists+linux-mips@lfdr.de>; Wed, 20 Aug 2025 10:19:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD06E584DA4
	for <lists+linux-mips@lfdr.de>; Wed, 20 Aug 2025 08:18:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0D7D2D9485;
	Wed, 20 Aug 2025 08:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TcDI8BmR"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F2F2D8764;
	Wed, 20 Aug 2025 08:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755677867; cv=none; b=r8DG18NemOD5l5q3TNIVs038M5S4IgXWrKD4jU9G56O+HOvz+Jy7CYyoiUP9u+VGaERxMDy7spAUAhYMVEukKv2D6t+eS6rJDbBUbCxhbC6BOa0iWIzuauvMN2LZuiefb2Zjn1FFhTr7CBYa1X9+1yx2TkeNzDlZ9qXznl6UXVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755677867; c=relaxed/simple;
	bh=rp+P8pJHQzECpJ19ab2gx3rZu9Rqs91hSMwN518ZAP4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XYLnIr+V67ZBPgPFDRth1GhXLapqlpmpb6HPJDzKJeHALLx8AlCiBeMAEZrx/5rKsJ1ep9sUf/+EQaqciH+V9IV/2JsSPum6K6Q5RHTRxx9ffIfY/9NBx2U1yqAPObT4Iak0fhgePDOt7Z2HukqnQb1MnMpcez+5WY9Lg5CwrI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TcDI8BmR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94E41C4CEEB;
	Wed, 20 Aug 2025 08:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755677867;
	bh=rp+P8pJHQzECpJ19ab2gx3rZu9Rqs91hSMwN518ZAP4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TcDI8BmRFyrw94WBpokTJBGVGvuSb/zZZZB0mlZUC/IR9t7ittqWaJWTxQBaAxGx6
	 gwcmHJ25OQ2vDr2FTDxeyzu64yuTnGId93bC0r0Pjcm7Ry90UCDqJxftv+8G+xnXnH
	 z4M63LhYtdR/kGq233+OGbDRrwsprpl2y4jmpsWgmR4TtYJoHd2fJCrzDfqsP5q1gX
	 gRmXvdC0TAY3NgcartyLl5bCcIgHPpW2yoe3pki80L3ziD5r06fRi+3knq5WfEtKKh
	 U2oJGr3XUdleCJRfDCiQTCTXnyJeaH3D/Rcd5rI81y4zDhlbA4oKIOrMP1xaJnlOnh
	 Z9SUJFzAlTg6g==
Date: Wed, 20 Aug 2025 10:17:44 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Aleksander Jan Bajkowski <olek2@wp.pl>
Cc: tsbogend@alpha.franken.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, john@phrozen.org, linux-mips@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] dt-bindings: mips: lantiq: dma: add name pattern
Message-ID: <20250820-jumping-enthusiastic-angelfish-6e764d@kuoka>
References: <20250815141759.3408909-1-olek2@wp.pl>
 <20250815141759.3408909-3-olek2@wp.pl>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250815141759.3408909-3-olek2@wp.pl>

On Fri, Aug 15, 2025 at 04:17:42PM +0200, Aleksander Jan Bajkowski wrote:
> Lantiq target doesn't use Common clock Framework and requires strict

And when it starts using CCF, then binding becomes wrong?

Best regards,
Krzysztof


