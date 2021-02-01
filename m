Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64FC230AD16
	for <lists+linux-mips@lfdr.de>; Mon,  1 Feb 2021 17:53:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231776AbhBAQwH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 1 Feb 2021 11:52:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231754AbhBAQwA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 1 Feb 2021 11:52:00 -0500
Received: from yawp.biot.com (yawp.biot.com [IPv6:2a01:4f8:10a:8e::fce2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07A3CC0613ED
        for <linux-mips@vger.kernel.org>; Mon,  1 Feb 2021 08:51:19 -0800 (PST)
Received: from debian-spamd by yawp.biot.com with sa-checked (Exim 4.93)
        (envelope-from <bert@biot.com>)
        id 1l6cQ1-00G8I7-DQ
        for linux-mips@vger.kernel.org; Mon, 01 Feb 2021 17:51:17 +0100
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on yawp
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.4
Received: from [2a02:578:460c:1:a555:6f6b:beff:dc54]
        by yawp.biot.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <bert@biot.com>)
        id 1l6cPt-00G8Hf-JE; Mon, 01 Feb 2021 17:51:09 +0100
Subject: Re: [PATCH] arch: mips: kernel: Made couple of spelling fixes and a
 sentence construction in smp.c
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>,
        tsbogend@alpha.franken.de, peterz@infradead.org,
        frederic@kernel.org, mingo@kernel.org, peterx@redhat.com,
        afzal.mohd.ma@gmail.com, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     rdunlap@infradead.org
References: <20210201111757.8019-1-unixbhaskar@gmail.com>
From:   Bert Vermeulen <bert@biot.com>
Message-ID: <48dfc60a-c03c-f9d8-a9aa-268f6ae252eb@biot.com>
Date:   Mon, 1 Feb 2021 17:51:07 +0100
MIME-Version: 1.0
In-Reply-To: <20210201111757.8019-1-unixbhaskar@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2/1/21 12:17 PM, Bhaskar Chowdhury wrote:
> s/debugees/debuge's/

Definitely not.


-- 
Bert Vermeulen
bert@biot.com
