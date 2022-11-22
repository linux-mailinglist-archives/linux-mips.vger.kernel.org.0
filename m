Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CB0F633C07
	for <lists+linux-mips@lfdr.de>; Tue, 22 Nov 2022 13:07:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232252AbiKVMHp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 22 Nov 2022 07:07:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232343AbiKVMHo (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 22 Nov 2022 07:07:44 -0500
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C92915FC5
        for <linux-mips@vger.kernel.org>; Tue, 22 Nov 2022 04:07:41 -0800 (PST)
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1oxS3v-0002LN-00; Tue, 22 Nov 2022 13:07:39 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id AA572C1CE2; Tue, 22 Nov 2022 13:07:02 +0100 (CET)
Date:   Tue, 22 Nov 2022 13:07:02 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-mips@vger.kernel.org, dengcheng.zhu@imgtec.com,
        Steven.Hill@imgtec.com, Qais.Yousef@imgtec.com, blogic@openwrt.org
Subject: Re: [PATCH v2 1/2] MIPS: vpe-mt: fix possible memory leak while
 module exiting
Message-ID: <20221122120702.GA10816@alpha.franken.de>
References: <20221104033945.1120044-1-yangyingliang@huawei.com>
 <20221104033945.1120044-2-yangyingliang@huawei.com>
 <20221122112156.GA9396@alpha.franken.de>
 <bd044af5-77ca-6e4f-1023-16f0b92302a8@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bd044af5-77ca-6e4f-1023-16f0b92302a8@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Nov 22, 2022 at 07:41:26PM +0800, Yang Yingliang wrote:
> Hi,
> 
> On 2022/11/22 19:21, Thomas Bogendoerfer wrote:
> > On Fri, Nov 04, 2022 at 11:39:44AM +0800, Yang Yingliang wrote:
> > > Afer commit 1fa5ae857bb1 ("driver core: get rid of struct device's
> > > bus_id string array"), the name of device is allocated dynamically,
> > > it need be freed when module exiting, call put_device() to give up
> > > reference, so that it can be freed in kobject_cleanup() when the
> > > refcount hit to 0. The vpe_device is static, so remove kfree() from
> > > vpe_device_release().
> > > 
> > > Fixes: 1fa5ae857bb1 ("driver core: get rid of struct device's bus_id string array")
> > > Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> > > ---
> > >   arch/mips/kernel/vpe-mt.c | 4 ++--
> > >   1 file changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/arch/mips/kernel/vpe-mt.c b/arch/mips/kernel/vpe-mt.c
> > > index bad6b0891b2b..84a82b551ec3 100644
> > > --- a/arch/mips/kernel/vpe-mt.c
> > > +++ b/arch/mips/kernel/vpe-mt.c
> > > @@ -313,7 +313,6 @@ ATTRIBUTE_GROUPS(vpe);
> > >   static void vpe_device_release(struct device *cd)
> > >   {
> > > -	kfree(cd);
> > >   }
> > as this is empty now, we can IMHO remove the function completly. Same
> > for the other patch in this series.
> It can not be removed, or it will cause WARNING in device_release() when
> calling
> put_device()/device_unregister().
> 
> static void device_release(struct kobject *kobj)
> {
> ...
> 
>         if (dev->release)
>                 dev->release(dev);
>         else if (dev->type && dev->type->release)
>                 dev->type->release(dev);
>         else if (dev->class && dev->class->dev_release)
>                 dev->class->dev_release(dev);
>         else
>                 WARN(1, KERN_ERR "Device '%s' does not have a release()
> function, it is broken and must be fixed. See
> Documentation/core-api/kobject.rst.\n",
>                         dev_name(dev));  // WANING here

you are right, thank you for looking into that,

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
