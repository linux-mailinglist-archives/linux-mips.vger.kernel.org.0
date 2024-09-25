Return-Path: <linux-mips+bounces-5641-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B062F985425
	for <lists+linux-mips@lfdr.de>; Wed, 25 Sep 2024 09:28:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F3F11B2401F
	for <lists+linux-mips@lfdr.de>; Wed, 25 Sep 2024 07:28:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64D0C157484;
	Wed, 25 Sep 2024 07:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OR1rjyCo"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E61156C5E;
	Wed, 25 Sep 2024 07:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727249163; cv=none; b=K80it/CXi/5p7nlg5NzJDZGts0VG9VNC3F2nhBA2NQEBwXCGwd2Jn0IXCzDfW5V8XFgQVdsiwALHoQB34PjNN37WJMsXc20vzi80mOgfXf2ojNnWgMbWKhIzdMgtqKcFrOxo0O9x7YPXmzrfB1zFWkEf0P7XxxC00aSznESTBMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727249163; c=relaxed/simple;
	bh=+Jc578DziKnNuyDXuSJKL+IptV/VTcEOs2p6s3mDx3c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XEZG0teJBKmlbWHI+wKdkt1fhBhLY47JOCrVVghP21eZFx2nJdlqvTNZZHET8xwI+ixEF/7DIPyGYL/LzBkJTf0iMARu0vzM49UKqUlvJVH7rKnX/YxNIAT7wZvW7TXx5j4NM5JM6SmqN2l+yLEGIx9M+TTovwo2QhACkO0smkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OR1rjyCo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5BFCC4CEC6;
	Wed, 25 Sep 2024 07:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727249162;
	bh=+Jc578DziKnNuyDXuSJKL+IptV/VTcEOs2p6s3mDx3c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OR1rjyCo0gp3TTd4+JmJdlTJPo0njj9LlYDJsg/KHcMXHeh2hJuViDSM+g4xILo3j
	 hCOGwmQdUeaUw1b6NwWAqOW+52Nc3uWkL0aWsXT74QLmD6Z58NhUNm6VRbZ1RcjW/9
	 P3F59VyefJLz3368RYHn28dPVB4MvTmh+dH+GKO2Y9l6/lT+6l5ZeKi9WQ904MBA91
	 HxK+JVSN3t03x1n7XTa1edAS9dB1gUbve+GXrc6TF7OceOMVuAZTR79fLY1r8kRtDO
	 kgYhLYXkTJRbZEfnve+rAU5dq6mSiesjgEwfVlGVdhi29Sc7BCbFJ6+jc9kFOkOwK4
	 pvfyVaHAS3kVQ==
Date: Wed, 25 Sep 2024 09:25:59 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: lee@kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	tsbogend@alpha.franken.de, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org
Subject: Re: [RFC PATCH v4.5] dt-bindings: mfd: Add Realtek RTL9300 switch
 peripherals
Message-ID: <ktztkdt6ahvg55l3mkkqopkavmbm5m6yst5fn7ea45jtoe4usp@rcwvp7y2h3ph>
References: <9abd5e65-da40-4283-b60e-46be5f89e858@alliedtelesis.co.nz>
 <20240924221626.3290531-1-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240924221626.3290531-1-chris.packham@alliedtelesis.co.nz>

On Wed, Sep 25, 2024 at 10:16:26AM +1200, Chris Packham wrote:
> Add device tree schema for the Realtek RTL9300 switches. The RTL9300
> family is made up of the RTL9301, RTL9302B, RTL9302C and RTL9303. These
> have the same SoC differ in the Ethernet switch/SERDES arrangement.
> 
> Currently the only supported features are the syscon-reboot and i2c
> controllers. The syscon-reboot is needed to be able to reboot the board.
> The I2C controllers are slightly unusual because they each own an SCL
> pin (GPIO 8 for the first controller, GPIO 17 for the second) but have 8
> common SDA pins which can be assigned to either controller (but not
> both).
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
> 
> This is my initial attempt at addressing Krzysztof's comments from my two
> series. I expect there may still be a bit of discussion on the binding so I'm
> just sending this on it's own rather than the whole series.

You need to change the reboot binding first, then you add this one
(either one or two patches).

Best regards,
Krzysztof


