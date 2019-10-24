Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7912E342F
	for <lists+linux-mips@lfdr.de>; Thu, 24 Oct 2019 15:30:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727384AbfJXNaK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 24 Oct 2019 09:30:10 -0400
Received: from foss.arm.com ([217.140.110.172]:51448 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727333AbfJXNaK (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 24 Oct 2019 09:30:10 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AD88AC8F;
        Thu, 24 Oct 2019 06:29:54 -0700 (PDT)
Received: from [10.37.9.200] (unknown [10.37.9.200])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7EFA53F71A;
        Thu, 24 Oct 2019 06:29:53 -0700 (PDT)
Subject: Re: v5.4-rcX: qemu-system-mips64 userspace segfault
To:     Bruce Ashfield <bruce.ashfield@gmail.com>,
        linux-mips@vger.kernel.org, paul.burton@mips.com
Cc:     Richard Purdie <richard.purdie@linuxfoundation.org>
References: <CADkTA4NT5MBzErPT5S49aswxH4bUi2KKCWEWppPpFgJ-ru3L=g@mail.gmail.com>
From:   Vincenzo Frascino <vincenzo.frascino@arm.com>
Message-ID: <40376b35-2220-67b6-7d9b-9a2c2a3874ef@arm.com>
Date:   Thu, 24 Oct 2019 14:31:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4NT5MBzErPT5S49aswxH4bUi2KKCWEWppPpFgJ-ru3L=g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Bruce,

On 10/24/19 2:12 PM, Bruce Ashfield wrote:
> Hi all,
> 
> I'm not sure if anyone else is running qemu-system-mips64 regularly,
> but for the past 4 (or more) years, it has been the primary way that
> we run QA on the mips64 Yocto Project reference kernel(s). I take care
> of the kernel for the project, so I always have the fun of running
> into issues first :D
> 
> That's enough preamble ...
> 
> I wanted to see if anyone recognized the issue that I'm seeing when I
> bumped the linux-yocto dev kernel to the v5.4-rc series.
> 
> The one line summary is that I'm seeing a segfault as soon as  the
> kernel hands off to userspace during boot. It doesn't matter if it is
> systemd, sysvinit, or init=/bin/sh .. I always get a segfault.
[...]

Could you please share the .config you are using?

Do you know by any change which vdso clock_mode is set in this scenario?

-- 
Regards,
Vincenzo
