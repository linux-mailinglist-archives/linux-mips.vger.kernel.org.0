Return-Path: <linux-mips+bounces-10520-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F3EB33057
	for <lists+linux-mips@lfdr.de>; Sun, 24 Aug 2025 16:19:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 21F18446D82
	for <lists+linux-mips@lfdr.de>; Sun, 24 Aug 2025 14:19:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A51352D9EC5;
	Sun, 24 Aug 2025 14:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q1tAD+aB"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D78E1E1DE3;
	Sun, 24 Aug 2025 14:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756045148; cv=none; b=em3OirDiUwmY2KIthixLSAVTKwQ0YJ7SNJqNkIxryKUy25AaWADuiokcDNdVpguHwjwCR/egzRG1NKoR5fVsAb+2tShZN5DIZuTVRgioDmXrm4iuSDdkR+yvy4dCRCZxuC6T9x6OSdNjlZ+SeTXRcbAlzhtFEAAui2orDtHWKOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756045148; c=relaxed/simple;
	bh=kIJf0VJJt3ewq7gJl50PmY1mDYlsRdah2ULtnLt7AGE=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=lMQd3tjWQK8aRkpr24PoZZtqf6WCHvgdqZKl+dBNwIJW6p4elU0fnTynZfGxgZpVl24HHzaIJOIRKvLsuBBBtrHCcaF1uVW0SZ2ssdMYMfgm17Lfs87ekXMvdMkUzYBCLBif8SsAnMC7xc1Reepx8Cn9dvJ234FaItR1WDk6Ntk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q1tAD+aB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 546B6C116B1;
	Sun, 24 Aug 2025 14:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756045148;
	bh=kIJf0VJJt3ewq7gJl50PmY1mDYlsRdah2ULtnLt7AGE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Q1tAD+aBscTv7TOAUXdFYqYXaQSmDeCBXqlrsh9waDdv8d6UsmqrC+tf95G/BHAuX
	 LnBf0IRxqRjlXehUhy/flWrG8sL7HWl/jpITfK2w0h/AL7C29XEpZs3ZONqPNWu98r
	 6Vle84Ipah/e9ZL3GoyDycwtNqUFXr4MHyeDlarBMjoVFGnhw15XruhnR4IDNj/TFt
	 CC74Z/b0Ie/XqP9umkC2BE+xZLbZMBJ5+BZCffNf2mfxZ0C+kXawejTInQbt3N9YVh
	 QXa5G3IxsIhIs+LtFErgH4xeU1QzlPiFPeGOVfQ2bhphhtOWLl3m3/ZoHB+2/JzuxA
	 ik1AFLzbNLwjA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EADC5383BF69;
	Sun, 24 Aug 2025 14:19:17 +0000 (UTC)
Subject: Re: [GIT PULL] MIPS fixes for v6.17
From: pr-tracker-bot@kernel.org
In-Reply-To: <aKrHQC7qQxQV3TKW@alpha.franken.de>
References: <aKrHQC7qQxQV3TKW@alpha.franken.de>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aKrHQC7qQxQV3TKW@alpha.franken.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips-fixes_6.17_1
X-PR-Tracked-Commit-Id: 8c431ea8f3f795c4b9cfa57a85bc4166b9cce0ac
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a69dfb4e0acb22fb6347656626520157948b3aa8
Message-Id: <175604515656.2399738.12691829872827627473.pr-tracker-bot@kernel.org>
Date: Sun, 24 Aug 2025 14:19:16 +0000
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: torvalds@linux-foundation.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 24 Aug 2025 10:03:12 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips-fixes_6.17_1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a69dfb4e0acb22fb6347656626520157948b3aa8

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

