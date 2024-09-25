Return-Path: <linux-mips+bounces-5646-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0FED986395
	for <lists+linux-mips@lfdr.de>; Wed, 25 Sep 2024 17:32:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 94914290EBA
	for <lists+linux-mips@lfdr.de>; Wed, 25 Sep 2024 15:31:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 533821459FA;
	Wed, 25 Sep 2024 15:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="j2ewohIQ"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CCEB84D3E;
	Wed, 25 Sep 2024 15:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727277990; cv=none; b=okwg696MGovUEEafspcXbK61ZqrvCvnlZNQOeGBJYFS8BeeTEhOTtYvBM5N5nTTtfIU3cwvZkD/TfcLByZtgYAPBDM9fV0FULRAtVa4/df8GCJp3EW2DS00Quq82AZcgMPVzGSdj6Jyq4Cl25XnyiZ++aMqYG8PN0U6xz+Mqcv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727277990; c=relaxed/simple;
	bh=FZw2esSJ8JMeJxYsUg/KyIqKkUkU2m/c5zegWsZrD2U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oxIe61dLiG00E3IBdzlDcpxR/9gasl/fS1Z9Wo42rdG5slRJ4CLMX9WuC4nB4KxxFrNL3gcYRqRWq0n/qanOW62B85quRClNym5HeQezZdNQ2sW3spbZuNs5QIBcsZSJ5zcxrScdb3zg/za4vkAnv66Mn7fRjBZD+ZHEAGct2DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=j2ewohIQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7256C4CEC3;
	Wed, 25 Sep 2024 15:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1727277989;
	bh=FZw2esSJ8JMeJxYsUg/KyIqKkUkU2m/c5zegWsZrD2U=;
	h=Date:From:To:Cc:Subject:From;
	b=j2ewohIQImfmBVZfZkssDvKvRgeqyGJ20DlNdXBewDrqPCfMOvX1YJV49AJJuTdHH
	 rIlEssvne92pal6pFAfOMTG3KynjUA01aYH3fD+w5NG6J3sXlO2lfLBZtVZ1EcO8vT
	 cLj2fw1G8Y9DxSzDMFInlC4bDmIsR0xMeEF2juqc=
Date: Wed, 25 Sep 2024 11:26:28 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: linux-mips@vger.kernel.org, linux-hams@vger.kernel.org
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>, helpdesk@kernel.org
Subject: Bouncing maintainer: Ralf Baechle
Message-ID: <20240925-flashy-innocent-goat-afdbe8@lemur>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello, all:

Ralf Baechle is listed as the sole maintainer for several MIPS- and HAMS-
related subsystems:

  - EDAC-CAVIUM OCTEON
  - IOC3 ETHERNET DRIVER
  - NETROM NETWORK LAYER
  - ROSE NETWORK LAYER

This subsystem lists a comaintainer:

  - TURBOCHANNEL SUBSYSTEM

I believe linux-mips.org went offline a few years ago and never recovered, and
by this point any mail sent to linux-mips.org is bouncing.

Please submit a patch to MAINTAINERS removing linux-mips.org references and
either:

- finding new maintainers for the affected subsystems
- marking these subsystems as "Orphan"

The goal is to not have any bouncing addresses in the MAINTAINERS file, so
please submit a fix as soon as the correct course of action is decided.

Best regards,
-- 
Konstantin Ryabitsev
Linux Foundation

bugspray track

