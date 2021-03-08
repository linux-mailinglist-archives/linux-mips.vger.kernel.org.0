Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 442563313BD
	for <lists+linux-mips@lfdr.de>; Mon,  8 Mar 2021 17:48:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230211AbhCHQsS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 8 Mar 2021 11:48:18 -0500
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:51992 "EHLO
        mx0a-00082601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229790AbhCHQsN (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 8 Mar 2021 11:48:13 -0500
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
        by mx0a-00082601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 128GYu2F032523;
        Mon, 8 Mar 2021 08:48:05 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=date : from : to : cc :
 subject : message-id : references : content-type : in-reply-to :
 mime-version; s=facebook; bh=ajMbIAzvFM8zP+F+QBTvBjVOMEd/n2CNAGiMlWhZNiY=;
 b=ml7lUt+/Xq3S9SRg0sZFRxdTlV0Ud6vemDYmLEyw4gMBHwTK87siwpwLy8XBPrBZeVqh
 m1o0uSRTjA08b+hxbGefqigcKAct1AODDjccHi9CEfub4dgf7EIUca6oIGFlAPQxC6E3
 shlAEKU2WIWwY4Kf1V5Wse6AjHdaJQ3qFks= 
Received: from mail.thefacebook.com ([163.114.132.120])
        by mx0a-00082601.pphosted.com with ESMTP id 374t97wcvg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Mon, 08 Mar 2021 08:48:04 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.199) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 8 Mar 2021 08:48:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G4cv1AJmMgksBcFdgOPsR3li75mUIkLJp/qaOZ5bUy6Oym5xiypjDwVNbwKMNm+SB1G1iRU7PFuA1Y+p8DIRvPTg50hZ/XBlj6bVuakBdMns5csrMTapz1LSc2yFc9qnINwME4So0xdTfPWadaDj5Y7d62DyN1lONLEZZIZaef8IYvJ9hFnoc43D2EG+3E8A4KPfw5BcK2gKJnBMEjtq+FEuQbHF1QBAWIV4Bzp7xOdo+rOKtoQ/gdpapmmloJwc0GIFdc1fCgxttbWa86Jn4DV9ijgirb9xrUaQiiiQvrpcTacer/5q3+SNZQK9XAs5mP7dkHkKi+wMqyPJkb8k0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ajMbIAzvFM8zP+F+QBTvBjVOMEd/n2CNAGiMlWhZNiY=;
 b=X3FT9AjcdL3sldJJ8bE462/2Rj0SOSr2JzNNMyLDkqK6MRBlwmWwhzz12nCciwDGAugTlYn57zDCiACz7x8rl82toFDZkbgGA3WtpDriJeE6ZFAHO+7AS+v9OCLx3wmbzb9DHYvtiWVohNIU4VkhW1e6gXDjr5fJHLOGO0YCFl3ozxbU5fvP39b3Yvst3ks8kPx+p+88YkYJCSFUTBkrj2ftxeq0lN4wYAE3TxPPlgdsIxZ63J8OCBZVLO707QoV4vvBtSY3iGshheVog8jZSmhA0dI1x45BWYdbLbWDDqwx6Spaq+jInl0TbrgMLtstMilMjUadII9jzF38uNTUGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Authentication-Results: alpha.franken.de; dkim=none (message not signed)
 header.d=none;alpha.franken.de; dmarc=none action=none header.from=fb.com;
Received: from BYAPR15MB4136.namprd15.prod.outlook.com (2603:10b6:a03:96::24)
 by BYAPR15MB2214.namprd15.prod.outlook.com (2603:10b6:a02:8d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.26; Mon, 8 Mar
 2021 16:48:03 +0000
Received: from BYAPR15MB4136.namprd15.prod.outlook.com
 ([fe80::53a:b2c3:8b03:12d1]) by BYAPR15MB4136.namprd15.prod.outlook.com
 ([fe80::53a:b2c3:8b03:12d1%7]) with mapi id 15.20.3912.027; Mon, 8 Mar 2021
 16:48:03 +0000
Date:   Mon, 8 Mar 2021 08:47:58 -0800
From:   Roman Gushchin <guro@fb.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
CC:     Mike Rapoport <rppt@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        <linux-mips@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Kamal Dasu <kdasu.kdev@gmail.com>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>
Subject: Re: [PATCH v2] MIPS: kernel: Reserve exception base early to prevent
 corruption
Message-ID: <YEZVPldiRC+n4cCA@carbon.dhcp.thefacebook.com>
References: <20210306082910.3472-1-tsbogend@alpha.franken.de>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210306082910.3472-1-tsbogend@alpha.franken.de>
X-Originating-IP: [2620:10d:c090:400::5:7d61]
X-ClientProxiedBy: MW4PR04CA0153.namprd04.prod.outlook.com
 (2603:10b6:303:85::8) To BYAPR15MB4136.namprd15.prod.outlook.com
 (2603:10b6:a03:96::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from carbon.dhcp.thefacebook.com (2620:10d:c090:400::5:7d61) by MW4PR04CA0153.namprd04.prod.outlook.com (2603:10b6:303:85::8) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Mon, 8 Mar 2021 16:48:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b1985f43-36c9-4c6f-149c-08d8e251f05a
X-MS-TrafficTypeDiagnostic: BYAPR15MB2214:
X-Microsoft-Antispam-PRVS: <BYAPR15MB2214D30796459D64F070B439BE939@BYAPR15MB2214.namprd15.prod.outlook.com>
X-FB-Source: Internal
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: diU+awujkpAGBp4SvPJFZm3V1rZ8xIVSy05SwDkmRAq4cj9FDeUpH8nDoLdINJFmbz/XafIJAcbr+5o6i5bym10RGPTHspr3Q/R/QOaxREEHZvqg2vwRnb/GvE+I4ulwG5J4fzF/2EgqiXGeTy6oiDlqyFaWERlVGbxbZZtwLEXWGQT37egEr7TuLQFbUl2r9ZR+dbYx/ec9sz5I6pRXDAMyigjs3eIhgPfH0XNpaZopNmGa6IFvKdXB6a7kk6rIXtUbZO6Avcby/iv7ClJ3IOapUA+MsSzgioLUnp7fuRj5ImWXcQGnThYIpFlrEPeP0JrbEDnfLkE5yYw13UnSPaZkUTHUzKaCSxFJk1ax+OFP7dFFYk6fyt0BIUnS1AqIiImAm8dh6RP4l6zCgsls067JkxkYCTIa00B5BbOaZROO+w30Pm0e17502nU8G5q4HA6dKAJ4FNHusxgVTqu+wxEjXWXY5AEtqpVOg8ZVkZwEmRibd4mDGIMl4nL8IE47YtvSAIHWKC2BdGWk7dns1DbiSuUyGj0hdI0veWwyOGFNxZhww32lbghRjRruk7gV
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR15MB4136.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(366004)(136003)(346002)(39860400002)(396003)(8676002)(6666004)(2906002)(66946007)(66556008)(5660300002)(6916009)(66476007)(478600001)(316002)(8936002)(54906003)(186003)(9686003)(4326008)(83380400001)(7696005)(52116002)(86362001)(6506007)(16526019)(55016002)(67856001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?giajj3ByryGaUkkp0K8xo0tJDS4fLNcB5Ambi6rCnAdPX7r6No64J81jR0iv?=
 =?us-ascii?Q?+cSiqCEolQkKsN/g5Mr05IeWjoiCb8fzFiGcPRIpRfjdd0cl0uX6HuJ4E9md?=
 =?us-ascii?Q?KYBNgzG/z3AjB0q49TAZUkg1hHqG1gQoFvb77jdolBjanq8bBNCYrdhL8jlq?=
 =?us-ascii?Q?lpJHG8AUNViLPU9vn7S9jsfb7DvwH4XAg8dVvk+oz+hsHBzMExZI0pcZdDX4?=
 =?us-ascii?Q?ONm7AICImCAlX7L0wrfqTWR9r2tfOJDd+tsHgqb1T2rr02b9UczDe8q4rmwk?=
 =?us-ascii?Q?pskPPw7q31+tTHNBGBYCWqLG2Knwf1+2pI+5AdXNq5YYHKvfPIckC7TjY4jS?=
 =?us-ascii?Q?I8EthL9rNBRMROE5zx9E9ZQAapXJs/HDx1uxcOmtcw+1xJtWhkLot9rRS7J1?=
 =?us-ascii?Q?QQdrMpzpGDtvB6dWwzZmv3+ye0pj4vB5S6giXrYvITBVRSKOhj0tHrBMijUY?=
 =?us-ascii?Q?lApQSGJ0Jfm2fIkqei+EIY/ERa9FiO7aybqcAjHhyHysLLl0opy+Cjeksinl?=
 =?us-ascii?Q?T4PSXNwkvoWt5423iAAQjhTHFQ8pGsFFNkXzdfGpQwx49XCMNUPt63QQNCOh?=
 =?us-ascii?Q?Zej3jD4NsunVst5MnMcpg/3XuDiHbYf+zXrOZdHMEgZyHJXL0qhDYy2XuzDW?=
 =?us-ascii?Q?WkyLIoA2WzfueGFOU7A8nLvGP7R9NvGewUQe/8hSN/iluN5cpA1eGQqMhBFl?=
 =?us-ascii?Q?8DrFA3a8xVfqdRNr9Hgh9fBRjjhx9EjIoCOo5jjFYNhNJ2iT94GnXbMY72ax?=
 =?us-ascii?Q?BSnXIZSpscQ9bvksUWvSqrX1mCjQ65c1nbC7Wo1ROlNzNjpxGVWRTdPkF3su?=
 =?us-ascii?Q?PvP/l3eFr9oiOTxnotlemq0c/YhhxLxr0pisyVxFW7Gyqsq6qat+87KXtuG/?=
 =?us-ascii?Q?OQg7wnnRRzVE+Zd32oO6Aozi62OJ9/699BZ42T17uzu09JOZMv+a6mMWiTBl?=
 =?us-ascii?Q?Thg4Lk3PN7l3/XXJ/109JTHzenXkuGtAu0j/ZAh8/1a1l9otoMPEqSIfTK/Q?=
 =?us-ascii?Q?A2MfUf4YVKZVnpJeo93n0Iaxvg47iuzXpR+gF63UfTbnu75FVbs3fY0cJfmw?=
 =?us-ascii?Q?LzFAdGysWxcmnx3zQLo4vOKEj6cwPP3SEzahEmZa2Ay9I5iACHa0DdIU4ga0?=
 =?us-ascii?Q?cZXl2fF+IWuis4M0I0m/RldkHEp0CaZ0UYfUa3CutUQCtUM1oDy8th4q2SCA?=
 =?us-ascii?Q?Qzyng65UcZIlD78x42q6DYKjwKV2AN3OE/jpEb0AJ+nv8FAZQIwY7RnHxmx9?=
 =?us-ascii?Q?Msy6hv0JnmZEZYaqBgvE8QfG+4P6rdgUOhQ6YgYQOtyQsKlf2xMXQdIK6hAJ?=
 =?us-ascii?Q?PEpFUwU+j+YuuZzx5bSl3V8Nio8/y4Kl5dHrI1QZAo9Xdw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b1985f43-36c9-4c6f-149c-08d8e251f05a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB4136.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2021 16:48:02.9066
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5cHZ9P0NEa9TYw0ZqZ6V5Qu4XlwWlMKVbLt6VMo75ZrItDxVtzF/XHf0MiQxmFNS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2214
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-08_11:2021-03-08,2021-03-08 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0 mlxscore=0
 impostorscore=0 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 mlxlogscore=999 adultscore=0
 priorityscore=1501 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2103080090
X-FB-Internal: deliver
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Mar 06, 2021 at 09:29:09AM +0100, Thomas Bogendoerfer wrote:
> BMIPS is one of the few platforms that do change the exception base.
> After commit 2dcb39645441 ("memblock: do not start bottom-up allocations
> with kernel_end") we started seeing BMIPS boards fail to boot with the
> built-in FDT being corrupted.
> 
> Before the cited commit, early allocations would be in the [kernel_end,
> RAM_END] range, but after commit they would be within [RAM_START +
> PAGE_SIZE, RAM_END].
> 
> The custom exception base handler that is installed by
> bmips_ebase_setup() done for BMIPS5000 CPUs ends-up trampling on the
> memory region allocated by unflatten_and_copy_device_tree() thus
> corrupting the FDT used by the kernel.
> 
> To fix this, we need to perform an early reservation of the custom
> exception space. So we reserve it already in cpu_probe() for the CPUs
> where this is fixed. For CPU with an ebase config register allocation
> of exception space will be done in trap_init().
> 
> Huge thanks to Serget for analysing and proposing a solution to this
> issue.
> 
> Fixes: 2dcb39645441 ("memblock: do not start bottom-up allocations with kernel_end")
> Reported-by: Kamal Dasu <kdasu.kdev@gmail.com>
> Debugged-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> ---
> Changes in v2:
>  - do only memblock reservation in reserve_exception_space()
>  - reserve 0..0x400 for all CPUs without ebase register and
>    to addtional reserve_exception_space for BMIPS CPUs
> 
>  arch/mips/include/asm/traps.h    |  3 +++
>  arch/mips/kernel/cpu-probe.c     |  7 +++++++
>  arch/mips/kernel/cpu-r3k-probe.c |  3 +++
>  arch/mips/kernel/traps.c         | 10 +++++-----
>  4 files changed, 18 insertions(+), 5 deletions(-)

Acked-by: Roman Gushchin <guro@fb.com>

Thanks!

> 
> diff --git a/arch/mips/include/asm/traps.h b/arch/mips/include/asm/traps.h
> index 6aa8f126a43d..b710e76c9c65 100644
> --- a/arch/mips/include/asm/traps.h
> +++ b/arch/mips/include/asm/traps.h
> @@ -24,8 +24,11 @@ extern void (*board_ebase_setup)(void);
>  extern void (*board_cache_error_setup)(void);
>  
>  extern int register_nmi_notifier(struct notifier_block *nb);
> +extern void reserve_exception_space(phys_addr_t addr, unsigned long size);
>  extern char except_vec_nmi[];
>  
> +#define VECTORSPACING 0x100	/* for EI/VI mode */
> +
>  #define nmi_notifier(fn, pri)						\
>  ({									\
>  	static struct notifier_block fn##_nb = {			\
> diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
> index 9a89637b4ecf..b565bc4b900d 100644
> --- a/arch/mips/kernel/cpu-probe.c
> +++ b/arch/mips/kernel/cpu-probe.c
> @@ -26,6 +26,7 @@
>  #include <asm/elf.h>
>  #include <asm/pgtable-bits.h>
>  #include <asm/spram.h>
> +#include <asm/traps.h>
>  #include <linux/uaccess.h>
>  
>  #include "fpu-probe.h"
> @@ -1628,6 +1629,7 @@ static inline void cpu_probe_broadcom(struct cpuinfo_mips *c, unsigned int cpu)
>  		c->cputype = CPU_BMIPS3300;
>  		__cpu_name[cpu] = "Broadcom BMIPS3300";
>  		set_elf_platform(cpu, "bmips3300");
> +		reserve_exception_space(0x400, VECTORSPACING * 64);
>  		break;
>  	case PRID_IMP_BMIPS43XX: {
>  		int rev = c->processor_id & PRID_REV_MASK;
> @@ -1638,6 +1640,7 @@ static inline void cpu_probe_broadcom(struct cpuinfo_mips *c, unsigned int cpu)
>  			__cpu_name[cpu] = "Broadcom BMIPS4380";
>  			set_elf_platform(cpu, "bmips4380");
>  			c->options |= MIPS_CPU_RIXI;
> +			reserve_exception_space(0x400, VECTORSPACING * 64);
>  		} else {
>  			c->cputype = CPU_BMIPS4350;
>  			__cpu_name[cpu] = "Broadcom BMIPS4350";
> @@ -1654,6 +1657,7 @@ static inline void cpu_probe_broadcom(struct cpuinfo_mips *c, unsigned int cpu)
>  			__cpu_name[cpu] = "Broadcom BMIPS5000";
>  		set_elf_platform(cpu, "bmips5000");
>  		c->options |= MIPS_CPU_ULRI | MIPS_CPU_RIXI;
> +		reserve_exception_space(0x1000, VECTORSPACING * 64);
>  		break;
>  	}
>  }
> @@ -2133,6 +2137,9 @@ void cpu_probe(void)
>  	if (cpu == 0)
>  		__ua_limit = ~((1ull << cpu_vmbits) - 1);
>  #endif
> +
> +	if (cpu_has_mips_r2_r6)
> +		reserve_exception_space(0, 0x400);
>  }
>  
>  void cpu_report(void)
> diff --git a/arch/mips/kernel/cpu-r3k-probe.c b/arch/mips/kernel/cpu-r3k-probe.c
> index abdbbe8c5a43..af654771918c 100644
> --- a/arch/mips/kernel/cpu-r3k-probe.c
> +++ b/arch/mips/kernel/cpu-r3k-probe.c
> @@ -21,6 +21,7 @@
>  #include <asm/fpu.h>
>  #include <asm/mipsregs.h>
>  #include <asm/elf.h>
> +#include <asm/traps.h>
>  
>  #include "fpu-probe.h"
>  
> @@ -158,6 +159,8 @@ void cpu_probe(void)
>  		cpu_set_fpu_opts(c);
>  	else
>  		cpu_set_nofpu_opts(c);
> +
> +	reserve_exception_space(0, 0x400);
>  }
>  
>  void cpu_report(void)
> diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
> index e0352958e2f7..808b8b61ded1 100644
> --- a/arch/mips/kernel/traps.c
> +++ b/arch/mips/kernel/traps.c
> @@ -2009,13 +2009,16 @@ void __noreturn nmi_exception_handler(struct pt_regs *regs)
>  	nmi_exit();
>  }
>  
> -#define VECTORSPACING 0x100	/* for EI/VI mode */
> -
>  unsigned long ebase;
>  EXPORT_SYMBOL_GPL(ebase);
>  unsigned long exception_handlers[32];
>  unsigned long vi_handlers[64];
>  
> +void reserve_exception_space(phys_addr_t addr, unsigned long size)
> +{
> +	memblock_reserve(addr, size);
> +}
> +
>  void __init *set_except_vector(int n, void *addr)
>  {
>  	unsigned long handler = (unsigned long) addr;
> @@ -2367,10 +2370,7 @@ void __init trap_init(void)
>  
>  	if (!cpu_has_mips_r2_r6) {
>  		ebase = CAC_BASE;
> -		ebase_pa = virt_to_phys((void *)ebase);
>  		vec_size = 0x400;
> -
> -		memblock_reserve(ebase_pa, vec_size);
>  	} else {
>  		if (cpu_has_veic || cpu_has_vint)
>  			vec_size = 0x200 + VECTORSPACING*64;
> -- 
> 2.29.2
> 
