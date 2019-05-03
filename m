Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C710913313
	for <lists+linux-mips@lfdr.de>; Fri,  3 May 2019 19:21:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727226AbfECRVQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 3 May 2019 13:21:16 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:32952 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726724AbfECRVQ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 3 May 2019 13:21:16 -0400
Received: by mail-lj1-f193.google.com with SMTP id f23so5890372ljc.0;
        Fri, 03 May 2019 10:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Y1z3Y8igEir/kIL8uEvgmKE9/Q/zi2rA9ZUq1wYqhIg=;
        b=IUkN0NIgisTvaKsVmuyeExZheDNyy9eAme5kMeshXiTYCGl60epTwzzDO2GUJAreKu
         pASeb9cMqEscZtpPkX9dfWnnxyD5qa0BY3zQvNLbNAf0ZMmAwjQVQzXgQl0b/cViF07X
         9PW/Bqvsl5Pa/DfsPxC6XK5uGD+CPBkNonEwel1MT1X+bvu7q492pwaBvO8klMPCMoUP
         fYFc9kdmg40Uq26MRiWF9EAKKKZelKEcxAkrJBsi4+epTTbdUA6VI2AKzYC442XPsPJK
         H2ckO23FCQ6rgqxbDwst5T6Jfg65JvRnThLOcbYR0bTwOl11yzrcP6SoZ4c7ZZBgU+ZH
         Biow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Y1z3Y8igEir/kIL8uEvgmKE9/Q/zi2rA9ZUq1wYqhIg=;
        b=pNA35YP+B+TU5BS1Y0hVJy3T/8GGTX6TXCJqH8T46ifd8I8L1dbv0bPue/vGXy1RFb
         EYgL+Yay75aw9afLyiRyArevMR/X3u21G0t6gqkN5BiOF9P5eIUVetY2qjlBTZfwXp3A
         NCX1s6sS+dBIpH59SQnk3tsDH/hkA0bDuUOgJZ/xymxc2Oj2ziq0/84iOES9UpIzteZi
         LTCfVq1DPZQuuVJHW2PjiaKoIin6NK/lvjM9Ji8N9XAj9o/d8N02Jwh2jwQQUOVPfm9R
         7t+z1mupvqrgvCZw9pYaCegGFfr3xR1NcUW1aeBM4HDXeOdl/HGBJ4C2ca3npo7gSAtl
         IoPg==
X-Gm-Message-State: APjAAAWZmepAkG1tmp1dc8g6l8xRdf4ii0ok2mG9VhizyvEFAbCRUx8w
        cNeWZ78LzPqlo7WTMsZxfe8=
X-Google-Smtp-Source: APXvYqyY7GCw9gRa4awuSK/u0rzIVlew/Kl87d69O4sE/JGvwV8ZiNCQ9rZ/Y4MJzAPHLfUehCROkA==
X-Received: by 2002:a2e:2a03:: with SMTP id q3mr5658596ljq.56.1556904073966;
        Fri, 03 May 2019 10:21:13 -0700 (PDT)
Received: from mobilestation ([5.164.217.122])
        by smtp.gmail.com with ESMTPSA id y10sm488084lja.71.2019.05.03.10.21.11
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 03 May 2019 10:21:12 -0700 (PDT)
Date:   Fri, 3 May 2019 20:21:10 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Paul Burton <paul.burton@mips.com>
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Michal Hocko <mhocko@suse.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Bogendoerfer <tbogendoerfer@suse.de>,
        Huacai Chen <chenhc@lemote.com>,
        Stefan Agner <stefan@agner.ch>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Juergen Gross <jgross@suse.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 04/12] mips: Reserve memory for the kernel image resources
Message-ID: <20190503172108.u7q7dpdo2ggbluar@mobilestation>
References: <20190423224748.3765-1-fancer.lancer@gmail.com>
 <20190423224748.3765-5-fancer.lancer@gmail.com>
 <20190424224343.4skr727fszycwksq@pburton-laptop>
 <20190426000035.yfonfvrapmm4j3fg@mobilestation>
 <20190430225832.cjk7mj6dotw3cib6@pburton-laptop>
 <20190502142434.mpoyu4hhbunur5xe@mobilestation>
 <20190502184537.ccxnrh6x7vg55kly@pburton-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190502184537.ccxnrh6x7vg55kly@pburton-laptop>
User-Agent: NeoMutt/20180716
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello Paul

On Thu, May 02, 2019 at 06:45:39PM +0000, Paul Burton wrote:
> Hi Serge,
> 
> On Thu, May 02, 2019 at 05:24:37PM +0300, Serge Semin wrote:
> > Just reviewed and tested your series on my machine. I tagged the whole series
> > in a response to the cover-letter of [1].
> 
> Thanks for the review & testing; that series is now in mips-next.
> 
> > Could you please proceed with this patchset review procedure? There are
> > also eight more patches left without your tag or comment.  This patch
> > is also left with no explicit tag.
> > 
> > BTW I see you already applied patches 1-3 to the mips-next, so what shall I
> > do when sending a v2 patchset with fixes asked to be provided for patch 12
> > and possibly for others in future? Shall I just resend the series without that
> > applied patches or send them over with your acked-by tagges?
> 
> I've so far applied patches 1-7 of your series to mips-next, and stopped
> at patch 8 which has a comment to address.
> 
> My preference would be if you could send a v2 which just contains the
> remaining patches (ie. patches 8-12 become patches 1-5), ideally atop
> the mips-next branch.
> 
> The series looks good to me once the review comments are addressed, but
> no need to add an Acked-by - it'll be implicit when I apply them to
> mips-next.
> 

Agreed. I'll do it shortly.

-Sergey

> Thanks,
>     Paul
