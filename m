Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 939F41362EC
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jan 2020 22:58:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725791AbgAIV6D (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 Jan 2020 16:58:03 -0500
Received: from hall.aurel32.net ([195.154.113.88]:58764 "EHLO hall.aurel32.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725775AbgAIV6D (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 9 Jan 2020 16:58:03 -0500
X-Greylist: delayed 2033 seconds by postgrey-1.27 at vger.kernel.org; Thu, 09 Jan 2020 16:58:03 EST
Received: from [2a01:e35:2fdd:a4e1:fe91:fc89:bc43:b814] (helo=ohm.rr44.fr)
        by hall.aurel32.net with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <aurelien@aurel32.net>)
        id 1ipfHh-0006YQ-JJ; Thu, 09 Jan 2020 22:24:05 +0100
Received: from aurel32 by ohm.rr44.fr with local (Exim 4.92.3)
        (envelope-from <aurelien@aurel32.net>)
        id 1ipfHg-007LRk-7h; Thu, 09 Jan 2020 22:24:04 +0100
Date:   Thu, 9 Jan 2020 22:24:04 +0100
From:   Aurelien Jarno <aurelien@aurel32.net>
To:     Jun Sun <jsun@junsun.net>
Cc:     qemu-discuss@nongnu.org, debian-mips@lists.debian.org,
        linux-mips@vger.kernel.org
Subject: Re: debian bootup hangs on qemu-system-mips64el
Message-ID: <20200109212404.GA1750666@aurel32.net>
Mail-Followup-To: Jun Sun <jsun@junsun.net>, qemu-discuss@nongnu.org,
        debian-mips@lists.debian.org, linux-mips@vger.kernel.org
References: <CAP5Nno5CPjV2mcf2ny8AtcC2ziqDkv6Kc7f4hCq1TF4DvKvJkw@mail.gmail.com>
 <CAP5Nno466s9M_7E0keMP3s=rDuZ48hrAb9-xAv52SsADr910XA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAP5Nno466s9M_7E0keMP3s=rDuZ48hrAb9-xAv52SsADr910XA@mail.gmail.com>
User-Agent: Mutt/1.13.2 (2019-12-18)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2020-01-04 20:46, Jun Sun wrote:
> On Wed, Jan 1, 2020 at 6:50 PM Jun Sun <jsun@junsun.net> wrote:
> >
> > Hi, all,
> >
> > Debian/mips64el runs well on qemu-system-mips64el until I turned on smp option with a number of 2 or higher.  See the error message below.  It usually hangs pretty early on.
> >

QEMU/mips doesn't really support SMP. The -smp option used to be for
SMT, but I am not even sure it really worked.

All that said, it's still a bug in QEMU to accept this option.

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                 http://www.aurel32.net
