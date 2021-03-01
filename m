Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38759329493
	for <lists+linux-mips@lfdr.de>; Mon,  1 Mar 2021 23:05:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234372AbhCAWEj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 1 Mar 2021 17:04:39 -0500
Received: from angie.orcam.me.uk ([157.25.102.26]:37176 "EHLO
        angie.orcam.me.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241169AbhCAWCk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 1 Mar 2021 17:02:40 -0500
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id 81D0992009C; Mon,  1 Mar 2021 23:01:49 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id 7B02892009B;
        Mon,  1 Mar 2021 23:01:49 +0100 (CET)
Date:   Mon, 1 Mar 2021 23:01:49 +0100 (CET)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Sergei Shtylyov <sergei.shtylyov@gmail.com>
cc:     Wang Qing <wangqing@vivo.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arch: mips: sibyte: Return -EFAULT if copy_to_user()
 fails
In-Reply-To: <3a7d2007-b7d2-e428-406c-a6804bff6df0@gmail.com>
Message-ID: <alpine.DEB.2.21.2103012254030.19637@angie.orcam.me.uk>
References: <1614580437-19660-1-git-send-email-wangqing@vivo.com> <3a7d2007-b7d2-e428-406c-a6804bff6df0@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, 1 Mar 2021, Sergei Shtylyov wrote:

> > The copy_to_user() function returns the number of bytes remaining to be
> > copied, but we want to return -EFAULT if the copy doesn't complete.
> 
>    Then 'err' is hardly a good name for that variable. :-)

 Something like `left' might be better, especially as it's the sole use.  
Also it's been like this from the beginning, so:

Fixes: bb9b813bb665 ("[MIPS] Sibyte: Fix ZBbus profiler")

or maybe:

Fixes: d619f38fdacb ("[MIPS] Add bcm1480 ZBus trace support, fix wait related bugs")

(since the file was renamed from a different name with the latter commit) 
would I think be helpful for backports too.  It looks like potentially 
quite a nasty bug to me if someone actually uses this piece (I haven't).

  Maciej
