Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF2EC34FC9A
	for <lists+linux-mips@lfdr.de>; Wed, 31 Mar 2021 11:24:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234658AbhCaJXl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 31 Mar 2021 05:23:41 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:53212 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234701AbhCaJX0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 31 Mar 2021 05:23:26 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12V997pU028970;
        Wed, 31 Mar 2021 09:23:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=Vv684mjMhZW1nHeChgMt6av/IRWieQCAmdzuF/7xDmE=;
 b=wDMU8uAQkfoQvbAqceMksVyEeAc3JnCmUxM8lUliaEjeMTXZARvlB7HhM2vfz2a5XVsl
 yWkAIBQVug9pqhO4OD2+rgXxEemOgr8nK3t4Zc28R9eq9nE+ST6ddFTCI2bquVxvtgKY
 M3iHvhmt+SYZKTveRxaEJFIi1wXCACbMry1/fhccIdnl4Fi1W0wiQ3GBj3O3CrmHTacf
 JRF5eBOLvqT8tYEsB568znEa5cS4XJG+chs5PC0iINcsA0JNTU9Kgkql/hKnpaitquw+
 2TcGY4yXnoid+rmwIWoqycti5SkcY2S+omuj/ngIJCzZqD9IbyJCUVCVh5T1kvLA+gHv hg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2130.oracle.com with ESMTP id 37mad9skka-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 31 Mar 2021 09:23:10 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12V9Jdoh067798;
        Wed, 31 Mar 2021 09:23:08 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3030.oracle.com with ESMTP id 37mabp67v1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 31 Mar 2021 09:23:08 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 12V9N4qk005080;
        Wed, 31 Mar 2021 09:23:04 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 31 Mar 2021 02:23:03 -0700
Date:   Wed, 31 Mar 2021 12:22:54 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Xu Jia <xujia39@huawei.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        WANG Xuerui <git@xen0n.name>,
        Dmitry Safonov <0x7f454c46@gmail.com>,
        Liangliang Huang <huanglllzu@gmail.com>,
        Xingxing Su <suxingxing@loongson.cn>,
        Huang Pei <huangpei@loongson.cn>, linux-mips@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH -next] mips: remove unused variable 'prev_state'
Message-ID: <20210331092254.GJ2065@kadam>
References: <1617180898-36838-1-git-send-email-xujia39@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1617180898-36838-1-git-send-email-xujia39@huawei.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9939 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0
 malwarescore=0 mlxlogscore=999 adultscore=0 spamscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2103300000 definitions=main-2103310068
X-Proofpoint-ORIG-GUID: DRJu5sx1abilbg90oKBJtI0tCnML3R8i
X-Proofpoint-GUID: DRJu5sx1abilbg90oKBJtI0tCnML3R8i
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9939 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 bulkscore=0 clxscore=1011 lowpriorityscore=0 suspectscore=0 adultscore=0
 spamscore=0 mlxscore=0 mlxlogscore=999 phishscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103300000
 definitions=main-2103310067
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Mar 31, 2021 at 04:54:58PM +0800, Xu Jia wrote:
> GCC reports the following warning with W=1:
> 
> arch/mips/kernel/traps.c:1593:17: warning:
>  variable 'prev_state' set but not used [-Wunused-but-set-variable]
>  1593 |  enum ctx_state prev_state;
>       |                 ^~~~~~~~~~
> 
> This variable is not used in function , this commit
> remove it to fix the warning.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Xu Jia <xujia39@huawei.com>
> ---
>  arch/mips/kernel/traps.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
> index 808b8b61ded1..d1f23ddf0c8c 100644
> --- a/arch/mips/kernel/traps.c
> +++ b/arch/mips/kernel/traps.c
> @@ -1590,10 +1590,8 @@ asmlinkage void do_watch(struct pt_regs *regs)
>  asmlinkage void do_mcheck(struct pt_regs *regs)
>  {
>  	int multi_match = regs->cp0_status & ST0_TS;
> -	enum ctx_state prev_state;
>  	mm_segment_t old_fs = get_fs();
>  
> -	prev_state = exception_enter();

Pretty sure the exception_enter() is still required...

>  	show_regs(regs);

regards,
dan carpenter

