Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97F24E714
	for <lists+linux-mips@lfdr.de>; Mon, 29 Apr 2019 17:59:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728592AbfD2P70 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 29 Apr 2019 11:59:26 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:38585 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728468AbfD2P70 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 29 Apr 2019 11:59:26 -0400
Received: from [192.168.1.110] ([77.9.18.117]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MauJJ-1gnRUd2VPH-00cTXC; Mon, 29 Apr 2019 17:59:00 +0200
Subject: Re: [PATCH 37/41] drivers: tty: serial: 8250: simplify io resource
 size computation
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        linux-kernel@vger.kernel.org
Cc:     gregkh@linuxfoundation.org, andrew@aj.id.au,
        andriy.shevchenko@linux.intel.com, macro@linux-mips.org,
        vz@mleia.com, slemieux.tyco@gmail.com, khilman@baylibre.com,
        liviu.dudau@arm.com, sudeep.holla@arm.com,
        lorenzo.pieralisi@arm.com, davem@davemloft.net, jacmet@sunsite.dk,
        linux@prisktech.co.nz, matthias.bgg@gmail.com,
        linux-mips@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org
References: <1556369542-13247-1-git-send-email-info@metux.net>
 <1556369542-13247-38-git-send-email-info@metux.net>
 <ba6dd5fa-36f1-902d-1ab4-c99e6a5ea3c2@physik.fu-berlin.de>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Organization: metux IT consult
Message-ID: <7cec8c1a-a0a1-e76c-5c1f-a93c591d38b1@metux.net>
Date:   Mon, 29 Apr 2019 17:58:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <ba6dd5fa-36f1-902d-1ab4-c99e6a5ea3c2@physik.fu-berlin.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:CLf6r+MSAE0A4USN6XIxWhLYiiz7bFAjEZVPWrDPzur1ECJt0Dg
 WbYbQxU9nNzapCPvww6NjJvdrqK+oNAJiHa6aeJbsi2v+NNA3fVkvAbLsn9n9KHoQGVfEzu
 N+fU79yInZYR1o784E8xzkrBIVHBDIoXmbRCOVD9oIABn/6VuVCGtjTlkSJlu3jg09HB7dD
 Ufze2K3kEFv4OnGLo+gYw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:c27b6UNW+M4=:Grv1CtdyDBcKDa6l5mVHjZ
 /D5eSBrMPo3nbal/qhD4JNTHZyIPmW+9PmXzwasR3bvmu01e4+e2/3REGNSHwZxpkqLIGKodv
 ngYXgywcAOndcT8KE1/CuZofSYrmrAtEKQg5qlBJvr+2yLpZxHva3ZCySbjq4tELVZUuPdKzR
 mEH6F8OQyT3xrEHoSc7e2QtCnWzxPxFbLx0iNnVNMfYEGoWKwVYyxWCWBQfwyRiy8Xls39WN3
 SDVgbyj7EImrGH9tgrtGkiwmjLoL4/Rb+O7KV8WFUCUwFDWfAapwIjNLi4DG1uD5qSVby6tg8
 xebSwSzH897s+7rcBH8fktM61frzzF2LtbCrjUQtxgWEGx8HmSycnqiNvsA8b9j7qHIY7PS2q
 P7j9mNJIltvQ9EZfT6EKeoPPPiKUb7Qxnq/lT1j6urv1655S1aqXVqGiR52p6pxci7e3STqFq
 WLToNwpFIBh0RZPtK0M9x1ljflXL2VYftmJO9JDAV7pDfMAtZq9tFP6PY8qaSELxX4LLivmvk
 PYlcrryV6+L1vAC2u/2tmg4poWrAgzzJi7UHbVCRwJPsx/voMQs4qhjp/yoCaND9PsJR2WD75
 Gi4sG/UZDQuUBmgY0L4oojNnw35PQrvO23nhJNHyzfGWEOdREVFSfAezaxcTHB6jH/olj6znw
 FQyJnUtrLFo04vaUyAW1Ja2Z09d8ocw78d4WnTdL4e95OakfRdw1InQcZq+Ldjbg1Gd6rRu7c
 KFOAwvaPDDf7d09bUPEBh9UlXxdk27dus0wWpVdGd3IBTsygMbjdJgUTyjA=
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 27.04.19 15:03, John Paul Adrian Glaubitz wrote:
> On 4/27/19 2:52 PM, Enrico Weigelt, metux IT consult wrote:
>> Simpily io resource size computation by setting mapsize field.
>     ^^^^
> Here's a typo

thx. fixed.

--mtx


-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
