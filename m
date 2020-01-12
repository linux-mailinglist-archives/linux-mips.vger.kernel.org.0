Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46C29138817
	for <lists+linux-mips@lfdr.de>; Sun, 12 Jan 2020 20:58:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733277AbgALT6N (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 12 Jan 2020 14:58:13 -0500
Received: from hall.aurel32.net ([195.154.113.88]:34770 "EHLO hall.aurel32.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728659AbgALT6M (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 12 Jan 2020 14:58:12 -0500
Received: from aurel32 by hall.aurel32.net with local (Exim 4.92)
        (envelope-from <aurelien@aurel32.net>)
        id 1iqjMu-000503-4O; Sun, 12 Jan 2020 20:57:52 +0100
Date:   Sun, 12 Jan 2020 20:57:52 +0100
From:   Aurelien Jarno <aurelien@aurel32.net>
To:     Jun Sun <jsun@junsun.net>
Cc:     qemu-discuss@nongnu.org, debian-mips@lists.debian.org,
        linux-mips@vger.kernel.org, lixing <13699171092@139.com>
Subject: Re: debian bootup hangs on qemu-system-mips64el
Message-ID: <20200112195752.GA18154@aurel32.net>
Mail-Followup-To: Jun Sun <jsun@junsun.net>, qemu-discuss@nongnu.org,
        debian-mips@lists.debian.org, linux-mips@vger.kernel.org,
        lixing <13699171092@139.com>
References: <CAP5Nno5CPjV2mcf2ny8AtcC2ziqDkv6Kc7f4hCq1TF4DvKvJkw@mail.gmail.com>
 <CAP5Nno466s9M_7E0keMP3s=rDuZ48hrAb9-xAv52SsADr910XA@mail.gmail.com>
 <20200109212404.GA1750666@aurel32.net>
 <CAP5Nno4d4r+yaARLGYd==5wznOMXf1Ufc2P-DjsVc-FavxLvUw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAP5Nno4d4r+yaARLGYd==5wznOMXf1Ufc2P-DjsVc-FavxLvUw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

On 2020-01-12 11:34, Jun Sun wrote:
> Are you sure QEMU/MIPS does not support SMP?  Below link written in
> 2016 clearly shows something was working then.
> 
> https://www.mips.com/blog/how-to-run-smp-linux-in-qemu-on-a-mips64-release-6-cpu/

It's not supported for the malta/mips64r2 combination you are trying to
use. It's clearly possible that it is supported for mips64r6, but it's a
different instruction set, so you can't run a standard Debian
distribution on it.

> Also, as Lixing mentioned in our private exchange, there is SMP
> support for loongson.  Lixing, I assume loongson SMP support is
> already merged in QEMU repo, right?  Can you point out the relevant
> source code directories?

Lixing mentioned virtualization. In that case it is indeed supported
like on other mips64r5 CPUs. For that you need to use add the -enable-kvm
option to the qemu command.

Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                 http://www.aurel32.net
