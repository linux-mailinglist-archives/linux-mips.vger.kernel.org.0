Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE19E217821
	for <lists+linux-mips@lfdr.de>; Tue,  7 Jul 2020 21:42:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727791AbgGGTme (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 7 Jul 2020 15:42:34 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:28212 "EHLO
        esa5.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726763AbgGGTmd (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 7 Jul 2020 15:42:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1594150953; x=1625686953;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=tOHVURBEOInJwVIcXjOFmIo5g3G/amkEqRC+nx/+ZLA=;
  b=JoHGVqu5wu5xTYEaLUt4w+tOkHDZNH3ziFgfnX94Urra9fiWLwe00CxT
   ou8pscLES/E6N7LucuPXtW0QVhMVRwapZP4oCHRGiKlx7i/Gvxin/oMnR
   AebBvxMMQKjNEqFGB++yOGIOqzfGXCJbf0aw9VbIwNMyNfQ5QLyXQIUmv
   JSEpxLiAYOl5jFYAIPo8mYz6zJ0LisJO1U7beL5/3IBIRwUWiJ1V9Jswq
   ZOtLt3tqLnkms9EQCZ0PPMvEdkRGZkRZqSxM87KqWCESWF1ZiknX8D7Xm
   toB+MqEzlN+GzOTfWH8RlouK4iRX12TsHZxfNkpRVJYI9itehuQ3C5iVH
   w==;
IronPort-SDR: YPd3o23JgwdslGHvZYg5pB4wCx/aE3YewTG10DNkJMQA+LyZFp2gaFQLKqJH9JZkct+p1KvtnB
 9kNE0DMwck3tpNcMW3nlNTQ8TSbNXbDMzlex1hpvFptLy7x/6UivcftC45DU4Q5W+sDvBpqSp1
 4ewB6saGQm0g4QogH67VhQgs3TiaxPOFS1tn5W4lvf1VZuDos6slrZ+ajeog0IHxMFvy6Y+cmQ
 kkUY/j5sZ8kPqgDXZb7bnjAXiZ6cougJRFn8EifflxYJddlQDWteEjG251V1cxEf473Pg3GSVg
 ks0=
X-IronPort-AV: E=Sophos;i="5.75,324,1589212800"; 
   d="scan'208";a="142035069"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 08 Jul 2020 03:42:33 +0800
IronPort-SDR: KFag0J31Vip02JEZZqKPI92JyZ3uA2aWzhaKdZaoB8tySAkbIZtY9jeerSO7BAB8dEcESyDice
 NOpVmqsfi3O4PmnxYHmAH7+Je3vu+utMo=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2020 12:30:39 -0700
IronPort-SDR: VyX1qYTnMdOW6J7QzoB07pb4TtNavklHsIeOreO4+iKOUzAJ7IdS4iObCEpvuUfU4HndJEdb+j
 Nx/dfAoTi+ag==
WDCIronportException: Internal
Received: from unknown (HELO redsun52) ([10.149.66.28])
  by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2020 12:42:32 -0700
Date:   Tue, 7 Jul 2020 20:42:24 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@wdc.com>
To:     Huacai Chen <chenhc@lemote.com>
cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "Maciej W. Rozycki" <macro@linux-mips.org>
Subject: Re: [PATCH V2] MIPS: Unify naming style of vendor CP0.Config6 bits
In-Reply-To: <1592397282-14433-1-git-send-email-chenhc@lemote.com>
Message-ID: <alpine.LFD.2.21.2007072040420.31807@redsun52.ssa.fujisawa.hgst.com>
References: <1592397282-14433-1-git-send-email-chenhc@lemote.com>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 17 Jun 2020, Huacai Chen wrote:

> Other vendor-defined registers use the vendor name as a prefix, not an
> infix, so unify the naming style of CP0.Config6 bits.

 LGTM; CONF7 macros would benefit from a similar cleanup (as a separate 
patch).

Reviewed-by: Maciej W. Rozycki <macro@linux-mips.org>

  Maciej
