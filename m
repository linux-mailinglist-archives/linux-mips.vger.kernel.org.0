Return-Path: <linux-mips+bounces-5647-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B490986437
	for <lists+linux-mips@lfdr.de>; Wed, 25 Sep 2024 17:54:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5B687B34FF7
	for <lists+linux-mips@lfdr.de>; Wed, 25 Sep 2024 15:33:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCA0413DBBE;
	Wed, 25 Sep 2024 15:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c1JJWwFC"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9740E13D89D;
	Wed, 25 Sep 2024 15:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727278223; cv=none; b=QgX+R9ysv9rcN0o+GHW+irKyZs5kSuiIssCl7DlSaEJSY7SXXlPE4139KI7AJjXAxUh4DnVlTJiAh/CT//frC6NMK4lTTPCWb/rXEvMlG2U8nUchy06xcvbaE4DsXqO6iuVotRLVcG2/79PYthZWjrWlfqN3ponunZXlI0itOsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727278223; c=relaxed/simple;
	bh=M7nNDeHfFLRSbJ/vO1+I1LN60u0f/QLFiJNFcAYTndw=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=BMWPH3XdZoMNd2F/YMS+qfYJ1GpfCdcYY4MaPl0D/sssaPHQZCA7v3+7Gl9UDQMFRJpdVOrcXIwAxqrsXN7GBWRLqeWMbo9+W4xj1EsRl29MsVS2nGay7SOtY9A7e0qCABefP6MmGSOjR9TJ0uusQtFCAdBUb1p2WW1j/XYW8Dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c1JJWwFC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41284C4CEC6;
	Wed, 25 Sep 2024 15:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727278223;
	bh=M7nNDeHfFLRSbJ/vO1+I1LN60u0f/QLFiJNFcAYTndw=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=c1JJWwFCMp/bVdKrynHu1Km23yhbSnX2uX2AGO7gF6J+TcGU1ooYIH1+5njiJ6Uh6
	 Ran2/RW/on7TButd/EsBkClR9X+yZXjfyeJrBjzb6GgyUv3pcDyQo0Qf8UVCP+eB10
	 Q77kHIYAN8ed8ZD1WA/5fABv+KOiP2rdVKU1tVZq3IZWFRyeWMiO8RP60n6LvBigzu
	 i7Dh4O3SgH/pCxvcO8vdbYYcSmwrDxrbyhdMCWteXfxReeoxvr4iYZtk1BP1FJ942h
	 M/SkKfwIHdB2EQOonOlnGz1iFxrrWWd/T9TYEecd85t1xIhqDMVJNMMSU3Gp4pROoj
	 yILTs/GRkWESQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B51E23809A8F;
	Wed, 25 Sep 2024 15:30:26 +0000 (UTC)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: Bugspray Bot <bugbot@kernel.org>
To: linux-hams@vger.kernel.org, helpdesk@kernel.org, macro@orcam.me.uk, 
 konstantin@linuxfoundation.org, linux-mips@vger.kernel.org
Message-ID: <20240925-b219325-df57a5dbcddf@bugzilla.kernel.org>
In-Reply-To: <20240925-flashy-innocent-goat-afdbe8@lemur>
References: <20240925-flashy-innocent-goat-afdbe8@lemur>
Subject: Re: Bouncing maintainer: Ralf Baechle
X-Bugzilla-Product: kernel.org
X-Bugzilla-Component: Helpdesk
X-Mailer: bugspray 0.1-dev
Date: Wed, 25 Sep 2024 15:30:26 +0000 (UTC)

Hello:

This conversation is now tracked by Kernel.org Bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=219325

There is no need to do anything else, just keep talking.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)


