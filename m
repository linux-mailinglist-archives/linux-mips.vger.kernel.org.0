Return-Path: <linux-mips+bounces-10648-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C32B37F2E
	for <lists+linux-mips@lfdr.de>; Wed, 27 Aug 2025 11:48:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C17A6201486
	for <lists+linux-mips@lfdr.de>; Wed, 27 Aug 2025 09:48:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33C4F27F015;
	Wed, 27 Aug 2025 09:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HhxesxhQ"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091EF25B1DA;
	Wed, 27 Aug 2025 09:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756288120; cv=none; b=hB+LfU7cHG4JOmv5CNphKrR6hindjbMSq/P+gaSbwHBfZwHTJNrDWM5v5VmhAzNHWwPFYNRwpUoeWPJ5jtMvqTiO+nJTGJ7FVRAL8q+z6YBkQw6pG7833wJ1LKNYkBvXcplodhRuSdpfD3h5mGxusy6eFR+kFwuQtndOHRrAVuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756288120; c=relaxed/simple;
	bh=xgFUmk0qJHnFdUv6YfFFZde1Uqh5rKr8K5dZmrz2Zdg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NKat4BXM0Pkmyf/t3K4A0VE8cEt8slCnboFToQuZYeuVewnZr7Yt7/zRi1oPJZuHJznPpEYnHFDaT/BJacaOM1sfwwUdL1GWfysiMkUkqztFkuuco13+eSPlfbg+Zd6nrTXF7V9CG0v32yrFtCdgEczt6KH5sc2Cpb4CafaH2W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HhxesxhQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84182C4CEEB;
	Wed, 27 Aug 2025 09:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756288119;
	bh=xgFUmk0qJHnFdUv6YfFFZde1Uqh5rKr8K5dZmrz2Zdg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HhxesxhQBdgHVDjJjPK3seJGASH33TAolppJltgS7D7tARpsuGklonYhRw0JVPTkZ
	 EGAAGWf7YwTO80NTcG8LruhzNkNAVPUUq3yKho3ldk5bgD0tqRmfJrsJw40d2aLdPc
	 Gv3PdFRj1ypMI8tuevjfsUoxq0kkGKbWAK1lMJ+qufCXj3npPElB7/FefLmZhoIKv9
	 b5/DH1ifSsE5G7RgKhR8bi9FzKx4J/bFf1XCve57FpeDqkjmjuRrcbjHhx5yambpQV
	 x/5Q0Dsd3HHFaut3HW7htZptk9UJ4Gt3IA7Il7AyAft0ZpidMXQuI1TLc7z0CzhpGU
	 JxZyVNqezNe3w==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1urClX-000000002Id-0Vze;
	Wed, 27 Aug 2025 11:48:27 +0200
Date: Wed, 27 Aug 2025 11:48:27 +0200
From: Johan Hovold <johan@kernel.org>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] reset: eyeq: fix OF node leak
Message-ID: <aK7Ua3GRBKSFC7Xu@hovoldconsulting.com>
References: <20250708085613.15823-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250708085613.15823-1-johan@kernel.org>

On Tue, Jul 08, 2025 at 10:56:13AM +0200, Johan Hovold wrote:
> Make sure to drop the OF node reference taken when probing the auxiliary
> device when the device is later unbound.
> 
> Fixes: 487b1b32e317 ("reset: eyeq: add platform driver")
> Cc: Théo Lebrun <theo.lebrun@bootlin.com>
> Signed-off-by: Johan Hovold <johan@kernel.org>

Can this one be picked up?

Johan

