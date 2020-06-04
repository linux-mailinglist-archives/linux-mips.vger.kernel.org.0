Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AF611EDA4E
	for <lists+linux-mips@lfdr.de>; Thu,  4 Jun 2020 03:17:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726479AbgFDBRy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 3 Jun 2020 21:17:54 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:1598 "EHLO
        esa1.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725946AbgFDBRy (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 3 Jun 2020 21:17:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1591233473; x=1622769473;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=0DivikXZ8x9qa8yhcaXzmEKtkUwVteQDKTeeiHQh33I=;
  b=m7cad6rAAfeVQ+7rrQUJMFdhWeb6dPJUU7WPQb4bHTJcnrhc1KIECZN/
   7QW2ungKBsPZmLeyHq94tVVKF2ZwoM9kPY7RxwIXYsY46eBV1ePTqC1kP
   nTGtuzGUrXYRNMGS0uZEae2PMVMJZ4TczuxaOk8ZWzKEZuavK6nZWGYlJ
   gmqYVq9SA+KUlOmksQ8fQNmsWZI3VicP2/nTZQmAIXzOcf652hSsAplg/
   vs+stF+e9vi7+IlV9O+/+2ce1sPbBZhyS4wRP2LcR7klRRM24QnOPdwPG
   A/2bvYsrLrPnpTIwOzugmStsoYtnMNn6K4RwOSgOMjRIKRmHu6HvWEPg0
   g==;
IronPort-SDR: OthRJxWbN2NaEVEJ4Zq6/bd0ctj77ucWi3Rleq4VlT30DcsEx0YMaYVdP4B/xE8yL1vICdn0ed
 /X9UMdwpGnd8VN+Ht2Vxt+WVaWMpmVOun5ZXZp09H9VbITTb4gxfrxQIuwCQBtP8kx2DZzq+rC
 UuW3tbBMtZziwG345TRTmR4fMybzdhSVTodUZPtTVnd3laSjI6fVsC27CNmZJxF/NRbFAgcRtD
 Hf6HBWtaN4Xifu5rUWVpOHDRHS6atnLkdxcrdrsMdEz2xtda9AcrHyCtePoVsvU8rMqt9QRrnG
 u+U=
X-IronPort-AV: E=Sophos;i="5.73,470,1583164800"; 
   d="scan'208";a="248251573"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 04 Jun 2020 09:17:52 +0800
IronPort-SDR: mjx4IV6Uru6SI19YqzAouKHDbIRGsZ6vL7/a7EepeG2atLz43ARc1jH2d1/9j0lijkir0z0waS
 RaK9LBF2ll6O7rKLKhrD9ejxilwL8oel0=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2020 18:07:30 -0700
IronPort-SDR: xVA/OvRNrOCIBdNknR7Np4B7Tvs3ve6yyRRphKpCpJjMAqy+BGHqKT+u8VUC3AUIe5DSUL/KtF
 M6BleKmT80Rw==
WDCIronportException: Internal
Received: from unknown (HELO redsun52) ([10.149.66.28])
  by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2020 18:17:52 -0700
Date:   Thu, 4 Jun 2020 02:17:47 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@wdc.com>
To:     WANG Xuerui <kernel@xen0n.name>
cc:     yuanjunqing <yuanjunqing66@163.com>, tsbogend@alpha.franken.de,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        liulichao@loongson.cn, "Maciej W. Rozycki" <macro@linux-mips.org>
Subject: Re: [PATCH] function:stacktrace/mips: Fix function:stacktrace for
 mips
In-Reply-To: <43f35844-f78a-74a2-0e3d-184c3567d74f@xen0n.name>
Message-ID: <alpine.LFD.2.21.2006040212460.9519@redsun52.ssa.fujisawa.hgst.com>
References: <20200528123640.4285-1-yuanjunqing66@163.com> <11c90f15-0a25-e628-c8db-53343c351085@163.com> <43f35844-f78a-74a2-0e3d-184c3567d74f@xen0n.name>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, 29 May 2020, WANG Xuerui wrote:

> On 2020/5/29 17:29, yuanjunqing wrote:
> 
> >> diff --git a/arch/mips/kernel/mcount.S b/arch/mips/kernel/mcount.S
> >> index cff52b283e03..cd5545764e5f 100644
> >> --- a/arch/mips/kernel/mcount.S
> >> +++ b/arch/mips/kernel/mcount.S
> >> @@ -87,8 +87,15 @@ EXPORT_SYMBOL(_mcount)
> >>   	PTR_LA   t1, _etext
> >>   	sltu     t3, t1, a0	/* t3 = (a0 > _etext) */
> >>   	or       t1, t2, t3
> >> +	PTR_LA	 t2, stlab-4 	/* t2: "function:stacktrace" return address */
> >> +	move	 a1, AT		/* arg2: parent's return address */
> >>   	beqz     t1, ftrace_call
> >> -	 nop
> >> +	 nop			/* "function:stacktrace" return address */
> >> +stlab:
> >> +	PTR_LA	t2, stlab-4
> >> +	/* ftrace_call_end: ftrace_call return address */
> >> +	beq	t2,ra, ftrace_call_end
> >> +	nop

 Broken delay slot indentation.

> >>   #if defined(KBUILD_MCOUNT_RA_ADDRESS) && defined(CONFIG_32BIT)
> >>   	PTR_SUBU a0, a0, 16	/* arg1: adjust to module's recorded callsite */
> >>   #else
> >> @@ -98,7 +105,9 @@ EXPORT_SYMBOL(_mcount)
> >>   	.globl ftrace_call
> >>   ftrace_call:
> >>   	nop	/* a placeholder for the call to a real tracing function */
> >> -	 move	a1, AT		/* arg2: parent's return address */
> >> +	move	ra, t2		/* t2: "function:stacktrace" return address */

 Likewise.  NB I haven't investigated if the change makes sense.  A more 
detailed explanation in the change description is certainly needed.

  Maciej
