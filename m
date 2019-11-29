Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 77CD410D785
	for <lists+linux-mips@lfdr.de>; Fri, 29 Nov 2019 15:56:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726970AbfK2O4Z (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 29 Nov 2019 09:56:25 -0500
Received: from foss.arm.com ([217.140.110.172]:49006 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726608AbfK2O4Z (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 29 Nov 2019 09:56:25 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1659C30E;
        Fri, 29 Nov 2019 06:56:25 -0800 (PST)
Received: from [10.37.10.52] (unknown [10.37.10.52])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E20143F68E;
        Fri, 29 Nov 2019 06:56:23 -0800 (PST)
Subject: Re: [PATCH] mips: Fix gettimeofday() in the vdso library
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Paul Burton <paulburton@kernel.org>,
        mips-creator-ci20-dev@googlegroups.com,
        letux-kernel@openphoenux.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20191129143658.12224-1-vincenzo.frascino@arm.com>
 <307717BD-3233-4313-BAA8-7431F4C78773@goldelico.com>
From:   Vincenzo Frascino <vincenzo.frascino@arm.com>
Message-ID: <0b64c6bb-ffc7-059d-3cb3-012092e0fcf0@arm.com>
Date:   Fri, 29 Nov 2019 14:58:52 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <307717BD-3233-4313-BAA8-7431F4C78773@goldelico.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 11/29/19 2:52 PM, H. Nikolaus Schaller wrote:
> 
>> Am 29.11.2019 um 15:36 schrieb Vincenzo Frascino <vincenzo.frascino@arm.com>:
>>
>> The libc provides a discovery mechanism for vDSO library and its
>> symbols. When a symbol is not exposed by the vDSOs the libc falls back
>> on the system calls.
>>
>> With the introduction of the unified vDSO library on mips this behavior
>> is not honored anymore by the kernel in the case of gettimeofday().
>>
>> The issue has been noticed and reported due to a dhclient failure on the
>> CI20 board:
>>
>> root@letux:~# dhclient
>> ../../../../lib/isc/unix/time.c:200: Operation not permitted
>> root@letux:~#
>>
>> Restore the original behavior fixing gettimeofday() in the vDSO library.
>>
>> Cc: Paul Burton <paulburton@kernel.org>
>> Reported-by: H. Nikolaus Schaller <hns@goldelico.com>
>> Testes-by: H. Nikolaus Schaller <hns@goldelico.com> # CI20 with JZ4780
> ^^^ funny typo... -> Tested-by:

Ops, I copy-pasted it from your email ;) Can't trust you ;)

-- 
Regards,
Vincenzo
