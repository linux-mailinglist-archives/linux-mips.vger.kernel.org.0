Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE9EE6D2F43
	for <lists+linux-mips@lfdr.de>; Sat,  1 Apr 2023 11:14:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229721AbjDAJOk convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Sat, 1 Apr 2023 05:14:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbjDAJOj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 1 Apr 2023 05:14:39 -0400
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5923F65B9
        for <linux-mips@vger.kernel.org>; Sat,  1 Apr 2023 02:14:37 -0700 (PDT)
X-UUID: a3926297587548c99e94fec15f951ee4-20230401
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:bf3b4188-0391-49ad-8607-9240eb8a8c22,IP:10,
        URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
        N:release,TS:5
X-CID-INFO: VERSION:1.1.22,REQID:bf3b4188-0391-49ad-8607-9240eb8a8c22,IP:10,UR
        L:0,TC:0,Content:0,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
        release,TS:5
X-CID-META: VersionHash:120426c,CLOUDID:df88272a-564d-42d9-9875-7c868ee415ec,B
        ulkID:230401151806BJ68JPOK,BulkQuantity:1,Recheck:0,SF:23|17|19|43|102,TC:
        nil,Content:0,EDM:-3,IP:-2,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,OSI
        :0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: a3926297587548c99e94fec15f951ee4-20230401
X-User: lienze@kylinos.cn
Received: from [192.168.3.105] [(61.48.209.226)] by mailgw
        (envelope-from <lienze@kylinos.cn>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 1913009488; Sat, 01 Apr 2023 17:14:30 +0800
Message-ID: <dda8afc67055372f1322750e851ab4001300ea65.camel@kylinos.cn>
Subject: Re: [PATCH] MIPS: tlbex: undefine pr_define macro when appropriate
From:   Enze Li <lienze@kylinos.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     rppt@kernel.org, akpm@linux-foundation.org, nathan@kernel.org,
        linux-mips@vger.kernel.org, enze.li@gmx.com
Date:   Sat, 01 Apr 2023 17:14:28 +0800
In-Reply-To: <20230401071708.GA4262@alpha.franken.de>
References: <20230401061025.3556622-1-lienze@kylinos.cn>
         <20230401071708.GA4262@alpha.franken.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.48.0 
MIME-Version: 1.0
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, 2023-04-01 at 09:17 +0200, Thomas Bogendoerfer wrote:
> On Sat, Apr 01, 2023 at 02:10:25PM +0800, Enze Li wrote:
> > The pr_define macro is used only within the
> > output_pgtable_bits_defines
> > function, and it hasn't been used anywhere else so far.  Therefore,
> > it
> > should be undefined when appropriate.
> > 
> > Signed-off-by: Enze Li <lienze@kylinos.cn>
> > ---
> >  arch/mips/mm/tlbex.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/arch/mips/mm/tlbex.c b/arch/mips/mm/tlbex.c
> > index 80e05ee98d62..510a7e316eb6 100644
> > --- a/arch/mips/mm/tlbex.c
> > +++ b/arch/mips/mm/tlbex.c
> > @@ -255,6 +255,8 @@ static void output_pgtable_bits_defines(void)
> >         pr_define("_PAGE_DIRTY_SHIFT %d\n", _PAGE_DIRTY_SHIFT);
> >         pr_define("_PFN_SHIFT %d\n", _PFN_SHIFT);
> >         pr_debug("\n");
> > +
> > +#undef pr_define
> 
> I'm probably missing something... what problem are you fixing here ?
> 
> Thomas.
> 

Hi Thomas,

Thanks for your review.  🙂

I'm trying to make the code more readable.  When I first looked at this
function, I was wondering why the pr_define macro was defined here.  It
looks more like a temporary definition, and I was also curious if it
might be used elsewhere.  After searching, I couldn't find any other
instances of it being used, which left me feeling confused.

To enhance readability, it would be good to undefine it at the end of
the function, indicating that it only works within this function, just
like what this patch did.  Alternatively, we can move this macro
definition to the beginning of the file, so that it can be used
throughout the module as shown below.

What do you think of these modifications?  Will they make it more
convenient for others who read this code?

Best Regards,
Enze

--- a/arch/mips/mm/tlbex.c
+++ b/arch/mips/mm/tlbex.c
@@ -37,6 +37,9 @@
 #include <asm/setup.h>
 #include <asm/tlbex.h>
 
+#define pr_define(fmt, ...)                                    \
+       pr_debug("#define " fmt, ##__VA_ARGS__)
+
 static int mips_xpa_disabled;
 
 static int __init xpa_disable(char *s)
@@ -231,9 +234,6 @@ static void uasm_bgezl_label(struct uasm_label **l,
u32 **p, int instance)
  */
 static void output_pgtable_bits_defines(void)
 {
-#define pr_define(fmt, ...)                                    \
-       pr_debug("#define " fmt, ##__VA_ARGS__)
-
        pr_debug("#include <asm/asm.h>\n");
        pr_debug("#include <asm/regdef.h>\n");
        pr_debug("\n");
