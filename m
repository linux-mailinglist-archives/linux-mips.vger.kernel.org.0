Return-Path: <linux-mips+bounces-4901-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ACDD7951AC1
	for <lists+linux-mips@lfdr.de>; Wed, 14 Aug 2024 14:23:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 691552853EA
	for <lists+linux-mips@lfdr.de>; Wed, 14 Aug 2024 12:23:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70F241AC427;
	Wed, 14 Aug 2024 12:23:39 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40EC51B0106
	for <linux-mips@vger.kernel.org>; Wed, 14 Aug 2024 12:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723638219; cv=none; b=MtTCkeX21vTaFkqkF35ZqFK73BehDcYZj2BgH2Dg0Wo1CBgmb3H7mu11AmbiU15JqfgVHTd77EO21B4zhzeK9d/VPTk4RBv4JqtKvUZ2WBCygM9F8f9KcRhJ8r/VfhKddhuHw/LORaHkLBvqUH5Nfugo6kkYfadZFCEDGH5diIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723638219; c=relaxed/simple;
	bh=WFZf9XrxKlNMxqnDCSrDgLuJenjgkYMGvms7jfjNWbA=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=U2JyKbslZMw/QNHK2F5mBB4fdtipe1lNrrtf//z5fPpFpp5axPknc6p76/fdJ1xJu6+l92Uxm2uxK+B6NqwA0bIDTXZHFSLO6lWdjXy0nmgd+42eLpzHL7hIdazbzukI8aUP2MeICSMqCwRFM6XifeUBoFm55HM3Hn63wrLzjqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 2DC9B92009C; Wed, 14 Aug 2024 14:23:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 270C392009B;
	Wed, 14 Aug 2024 13:23:28 +0100 (BST)
Date: Wed, 14 Aug 2024 13:23:28 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Gaosheng Cui <cuigaosheng1@huawei.com>
cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    linux-mips@vger.kernel.org
Subject: Re: [PATCH -next] MIPS: dec: prom: Remove unused unregister_prom_console()
 declaration
In-Reply-To: <20240814104312.2056096-1-cuigaosheng1@huawei.com>
Message-ID: <alpine.DEB.2.21.2408141322270.59022@angie.orcam.me.uk>
References: <20240814104312.2056096-1-cuigaosheng1@huawei.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 14 Aug 2024, Gaosheng Cui wrote:

> The unregister_prom_console() has been removed since
> commit 36a885306fdf ("[MIPS] Fix and cleanup the mess that a dozen
> prom_printf variants are."), so remove it.
> 
> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
> ---

Acked-by: Maciej W. Rozycki <macro@orcam.me.uk>

 Thank you,

  Maciej

