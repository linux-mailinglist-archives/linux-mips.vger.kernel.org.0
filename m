Return-Path: <linux-mips+bounces-5718-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 77908988617
	for <lists+linux-mips@lfdr.de>; Fri, 27 Sep 2024 15:12:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 20B491F23215
	for <lists+linux-mips@lfdr.de>; Fri, 27 Sep 2024 13:12:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4506E18CC01;
	Fri, 27 Sep 2024 13:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="mpt16UpY"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4CFE189502;
	Fri, 27 Sep 2024 13:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727442755; cv=none; b=OkXv8zhJsq5hSvDg34XfE6lFg/4xoKH0K+hiPZjaIFNcO6bs+BhdgI3v8CDUdVugEmbXl5xO3dkvW7tO1sTd9bjAeWhD3CZ6PwfQcdlvvIN0BdjnCqoHnyA62UvvjI0eL0OIoemqLtRXcPcFVohASTG4cuK+ZBwaIzmMpHM8DrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727442755; c=relaxed/simple;
	bh=3QXDNlI+LGdYuepCu4MhZ4vRJEd4Jssx3QXBl28GW3k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OM8kZpeBhrs5SGNt+lFoTZE6K9l0lR7cVdVxpwbDBd9f+8qp9jCBekSexAT4GEpddLhQttDKGMTfOfT7AkZp/KK7MfGwFacLr3wFLTA24vzAkWI8NKwbhgp0de0svC4ErN/aIHz1WuaGPz01TDTHqgxLrlLO+HZJlpPzBf6ZDis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=mpt16UpY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F010C4CEC6;
	Fri, 27 Sep 2024 13:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1727442754;
	bh=3QXDNlI+LGdYuepCu4MhZ4vRJEd4Jssx3QXBl28GW3k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mpt16UpY+K5IGFkRJ+CVMnx3YZ6hZLT4mptD/mTGVCWXYhlflbOZSvLZ7tNrnvwiy
	 y9ghoR7x9RWooXd66XjENespLxVOZuda9qiEPySAujhAOjR/veu/h3yq2HHNUvUiay
	 esC9fFc6Tot7Nx6F2laPa6ng98ghbdesuhdZAMHM=
Date: Fri, 27 Sep 2024 09:12:33 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Bugspray Bot <bugbot@kernel.org>
Cc: helpdesk@kernel.org, linux-mips@vger.kernel.org, 
	linux-hams@vger.kernel.org, macro@orcam.me.uk, dan.carpenter@linaro.org
Subject: Re: Bouncing maintainer: Ralf Baechle
Message-ID: <20240927-competent-sapphire-seahorse-a36f41@lemur>
References: <f74c4234-a091-4cc3-b92b-469f506c16a5@stanley.mountain>
 <20240927-b219329-030e69c334a2@bugzilla.kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240927-b219329-030e69c334a2@bugzilla.kernel.org>

On Fri, Sep 27, 2024 at 01:00:17PM GMT, Bugspray Bot wrote:
> Hello:
> 
> This conversation is now tracked by Kernel.org Bugzilla:
> https://bugzilla.kernel.org/show_bug.cgi?id=219329

Clearly, bugbot still has some bugs. I'll see if we can silence him for
certain components, too.

-K

