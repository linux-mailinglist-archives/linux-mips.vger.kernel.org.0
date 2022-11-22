Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C94C633B59
	for <lists+linux-mips@lfdr.de>; Tue, 22 Nov 2022 12:29:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233408AbiKVL3k (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 22 Nov 2022 06:29:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232724AbiKVL2t (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 22 Nov 2022 06:28:49 -0500
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 69B505D681
        for <linux-mips@vger.kernel.org>; Tue, 22 Nov 2022 03:22:07 -0800 (PST)
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1oxRLo-00020O-00; Tue, 22 Nov 2022 12:22:04 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 9D0F5C1C88; Tue, 22 Nov 2022 12:21:56 +0100 (CET)
Date:   Tue, 22 Nov 2022 12:21:56 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-mips@vger.kernel.org, dengcheng.zhu@imgtec.com,
        Steven.Hill@imgtec.com, Qais.Yousef@imgtec.com, blogic@openwrt.org
Subject: Re: [PATCH v2 1/2] MIPS: vpe-mt: fix possible memory leak while
 module exiting
Message-ID: <20221122112156.GA9396@alpha.franken.de>
References: <20221104033945.1120044-1-yangyingliang@huawei.com>
 <20221104033945.1120044-2-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221104033945.1120044-2-yangyingliang@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Nov 04, 2022 at 11:39:44AM +0800, Yang Yingliang wrote:
> Afer commit 1fa5ae857bb1 ("driver core: get rid of struct device's
> bus_id string array"), the name of device is allocated dynamically,
> it need be freed when module exiting, call put_device() to give up
> reference, so that it can be freed in kobject_cleanup() when the
> refcount hit to 0. The vpe_device is static, so remove kfree() from
> vpe_device_release().
> 
> Fixes: 1fa5ae857bb1 ("driver core: get rid of struct device's bus_id string array")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  arch/mips/kernel/vpe-mt.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/mips/kernel/vpe-mt.c b/arch/mips/kernel/vpe-mt.c
> index bad6b0891b2b..84a82b551ec3 100644
> --- a/arch/mips/kernel/vpe-mt.c
> +++ b/arch/mips/kernel/vpe-mt.c
> @@ -313,7 +313,6 @@ ATTRIBUTE_GROUPS(vpe);
>  
>  static void vpe_device_release(struct device *cd)
>  {
> -	kfree(cd);
>  }

as this is empty now, we can IMHO remove the function completly. Same
for the other patch in this series.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
