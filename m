Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2765B34B76A
	for <lists+linux-mips@lfdr.de>; Sat, 27 Mar 2021 14:40:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230209AbhC0Nju (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 27 Mar 2021 09:39:50 -0400
Received: from wilbur.contactoffice.com ([212.3.242.68]:41044 "EHLO
        wilbur.contactoffice.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230126AbhC0NjQ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 27 Mar 2021 09:39:16 -0400
Received: from ichabod.co-bxl (ichabod.co-bxl [10.2.0.36])
        by wilbur.contactoffice.com (Postfix) with ESMTP id E6A4A624;
        Sat, 27 Mar 2021 14:39:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1616852352;
        s=20210208-e7xh; d=mailfence.com; i=sandberg@mailfence.com;
        h=Date:From:Reply-To:To:Cc:Message-ID:In-Reply-To:References:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding;
        l=707; bh=nNHErR/LMvBGwhGPf/3pQTA+qUcXmBxVBMJBIvMTo04=;
        b=Imw+3ORdfpmvxgTxdDJr1lRRiJVTp0n/EgeXwZf63jMdFtfE+i1DQMk2XRahZiV5
        lhdmLsvO3LmM0Fuw+3IkatIlu+OB9YC5gZdPFN5HbbsPK0PrpvZNTrfIYtn/Jcw+nJT
        3X8ti2evROSon1fqClKibYTT95Zb5KDQwiIn3DBHQfGTlGDFEga9GIdQhskkZoc+jNw
        3Ofa0AsH7vKLTq8W/gO7ZZ4jNmIssBxK/C7PhOAteUlo4PEGLU6AHKXcsl7hjrfa4Gi
        05tIV/M3AJzzi6W96pd9ysJqijh8I4UfDoo1JY3mvN1pTxXYKvId2RM2FPsmzRGagWZ
        kiNCJx/uSg==
Date:   Sat, 27 Mar 2021 14:39:09 +0100 (CET)
From:   Mauri Sandberg <sandberg@mailfence.com>
Reply-To: Mauri Sandberg <sandberg@mailfence.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     f.fainelli@gmail.com, linux-mips@vger.kernel.org
Message-ID: <942268520.6927.1616852349445@ichabod.co-bxl>
In-Reply-To: <20210327094011.GA4259@alpha.franken.de>
References: <20210326134158.268164-1-sandberg@mailfence.com> <20210326164645.433147-1-sandberg@mailfence.com> <20210327094011.GA4259@alpha.franken.de>
Subject: Re: [PATCH v2 0/1] MIPS: fix compilation error
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
X-Mailer: ContactOffice Mail
X-ContactOffice-Account: com:250217426
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



> ----------------------------------------
> From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> On Fri, Mar 26, 2021 at 06:46:44PM +0200, Mauri Sandberg wrote:
> > Earlier I had some confusion with my configuration as compared to
> > ath79_defconfig but now it looks like that enabling
> > CONFIG_MIPS_ELF_APPENDED_DTB alone will break compilation.
> > 
> > Simple fix of removing 'const' did not work and something more is needed.
> 
> your first fix works perfect for me. Could please describe what the error
> is ?

With fresh pair of eyes I must agree and it really does work. The freeze during boot must
have been related to something else and the v2 can be forgotten.

-- Mauri
