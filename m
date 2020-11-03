Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B56FF2A4D4D
	for <lists+linux-mips@lfdr.de>; Tue,  3 Nov 2020 18:42:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728946AbgKCRm0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 3 Nov 2020 12:42:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728937AbgKCRmZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 3 Nov 2020 12:42:25 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9D09C0613D1
        for <linux-mips@vger.kernel.org>; Tue,  3 Nov 2020 09:42:25 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id f21so8889651plr.5
        for <linux-mips@vger.kernel.org>; Tue, 03 Nov 2020 09:42:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Rsl6lmX6v9O2Z0QU9skbwTzUfbl2hHwSPUBkrUuyNCg=;
        b=cKgU/Gqe/ADQRGSSLoA+Hi1WdKWJVAS0bw9sAo3A7juygkGRAEwAO6/lVdIVcMr/lp
         tzUQ3K9GNGEXmW7YOQ7u/uVkhJjSc7ld47ie2rGKgMtmao07L9Zo4DP1Z37gK/FmMNvA
         2WuDZ+KOrtv3GTVmeAw2jxKZVU6LcGnPgWloevfWKKqRjd+ZI0jPKDcoNSVkeFb0yUwm
         E6manMKPEnUhkWZmrc78aTn2d0kGrbpZ5JfuY3eYcLqUrdzoKmZJ72a9UKvEl7BsS0NH
         CA0V2PoAfVmt7s6fkWOEoBLHwjEI4U0Tru/WfS8OUk5ADzmV8FeGCqvjCeOJrVi6lLJC
         8hZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Rsl6lmX6v9O2Z0QU9skbwTzUfbl2hHwSPUBkrUuyNCg=;
        b=qqOPm+HvtBsFmCEIakC4t7hJW259ZQeNsd2hbFsPJAKzArSJGUN4HSFQFP8wtApEIb
         ByvZANkvlYhaEXKM4QIOP7cDBKgi97e8QStJ9/75gFwQA72R69BwsnCQi/N0CMSlBRqa
         rgPaxbeyX2Kd+xxxTsrwln+Yh4+vUHqPoMFpakoTqWDXsMqkzLvUL/iR/RBP469iCT3/
         +T5uQppQDAq4zFgUBd0Zn0VwBQKujBrJ8vJs5o+L/Y7RMM6GxwBUaif4vSz5MfLk2dFZ
         y1UsSa3VAhOxYEvcWYaU1GfVP6iX1M3RmnOdEswce9Wq8lHg8+RZLixsGuwrXopvvto0
         qVVA==
X-Gm-Message-State: AOAM533fqWeDgrpZERv0URbpIkg/kbL3t5A7GHy4s/bhRrVnt3UfsMOR
        vVAhfW8e4M5sVGBSr/J2lKw=
X-Google-Smtp-Source: ABdhPJx21kD40fBue0zqwQCVJRyuZ5D4dRTQMSl7iEnZz7fibbcE4gACjoasQRUSstfq8J3CU+josw==
X-Received: by 2002:a17:902:9697:b029:d6:c3f6:8dcf with SMTP id n23-20020a1709029697b02900d6c3f68dcfmr12777394plp.8.1604425345253;
        Tue, 03 Nov 2020 09:42:25 -0800 (PST)
Received: from [10.230.28.234] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a18sm18711595pfg.54.2020.11.03.09.42.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2020 09:42:24 -0800 (PST)
Subject: Re: can we switch bmips to the generic dma ranges code
To:     Christoph Hellwig <hch@lst.de>, cernekee@gmail.com,
        f.fainelli@gmail.com, james.quinlan@broadcom.com
Cc:     linux-mips@vger.kernel.org, iommu@lists.linux-foundation.org,
        bcm-kernel-feedback-list@broadcom.com
References: <20201103101545.GA20851@lst.de>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <b7a673ca-db14-5b67-c1f4-068ed2b49bed@gmail.com>
Date:   Tue, 3 Nov 2020 09:42:23 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201103101545.GA20851@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 11/3/2020 2:15 AM, Christoph Hellwig wrote:
> Hi Florian and others,
> 
> now that the generic DMA ranges code landed, can we switch bmips over
> to it instead of duplicating the logic?

This should be fine, I cannot easily test the 338x chips, however as far
as PCIe goes, I believe Jim may have some older patches he can dig up
for testing.
-- 
Florian
