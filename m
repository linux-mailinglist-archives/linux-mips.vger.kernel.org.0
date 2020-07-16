Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B89622202E
	for <lists+linux-mips@lfdr.de>; Thu, 16 Jul 2020 12:03:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728031AbgGPKCO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 16 Jul 2020 06:02:14 -0400
Received: from elvis.franken.de ([193.175.24.41]:38170 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726963AbgGPKB5 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 16 Jul 2020 06:01:57 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jw0iA-0008Mc-01; Thu, 16 Jul 2020 12:01:54 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 5301CC080E; Thu, 16 Jul 2020 11:45:26 +0200 (CEST)
Date:   Thu, 16 Jul 2020 11:45:26 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Zhi Li <lizhi01@loongson.cn>
Cc:     chenhc@lemote.com, jiaxun.yang@flygoat.com, lixuefeng@loongson.cn,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/3] MIPS: Loongson: Fix some issues of cpu_hwmon.c
Message-ID: <20200716094526.GB8455@alpha.franken.de>
References: <1594266921-28971-1-git-send-email-lizhi01@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1594266921-28971-1-git-send-email-lizhi01@loongson.cn>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Jul 09, 2020 at 11:55:18AM +0800, Zhi Li wrote:
> v2:
>   - Drop the patch "MIPS: Loongson: Add hwmon support for generic CPU"
>   - Reduce possible loop times in do_thermal_timer()
> 
> v3:
>   - Fix boot warning about hwmon_device_register()
> 
> Tiezhu Yang (2):
>   MIPS: Loongson: Cleanup cpu_hwmon.c
>   MIPS: Loongson: Reduce possible loop times and add log in
>     do_thermal_timer()
> 
> Zhi Li (1):
>   MIPS: Loongson: Fix boot warning about hwmon_device_register()
> 
>  drivers/platform/mips/cpu_hwmon.c | 66 +++++++++++++++------------------------

series applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
