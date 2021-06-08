Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8460739FC5B
	for <lists+linux-mips@lfdr.de>; Tue,  8 Jun 2021 18:24:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232901AbhFHQZ7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 8 Jun 2021 12:25:59 -0400
Received: from mail-pg1-f179.google.com ([209.85.215.179]:38746 "EHLO
        mail-pg1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232873AbhFHQZ5 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 8 Jun 2021 12:25:57 -0400
Received: by mail-pg1-f179.google.com with SMTP id t17so372537pga.5;
        Tue, 08 Jun 2021 09:24:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tWUOLd7SDy3G4uRPATKyTli1+VRXa+Ne7jXYUe6DYzU=;
        b=idz2A5AlgDgjp7CZlQ2nnwhKuwZz2Fs9hf+etDzeMN5q7SDJm3sGb+2HDYIv/jAWA7
         Usu7QYBXx8Hjvhbf49UsrrMT2rAA+Q+zvFaEgj0JHj9yIk4xJWqP458BSH6c+cFoq5y+
         43nO1LAe2Ru/sPveNjAkU4CDRlDMeoA55uilFAAnPQIAd1tGYvfzGpo/TrAav5N1OhQy
         h8aRUUa2T7e2NlH+uHpG+j3MuvouRToyYXcDftFstX6wRq6mDoIr6sMfNehWujfbcaur
         uZoT7W0gjfVGZ+tZ/9ZkAOUsPPoDX4ue0nkJQ9gRSLzk/auE4P5mjDGT6IlbY51nQHhx
         hVJA==
X-Gm-Message-State: AOAM5324Zv+ELvvW36VNBBwrTdKzdEgABB8RvNKbAbaQl7lB0pUZNXoT
        3QUO5rypTrzkQ1t8SVWMfVdgDFVAgEE=
X-Google-Smtp-Source: ABdhPJw8yHF55mrEwh6e92tzycqNf1F5E5W7MS3iqsvoqL7+Q6ralpXCJFS3XAL+JOxp8CFbvFr8pQ==
X-Received: by 2002:a05:6a00:170c:b029:2dc:dd8f:e083 with SMTP id h12-20020a056a00170cb02902dcdd8fe083mr663455pfc.77.1623169441463;
        Tue, 08 Jun 2021 09:24:01 -0700 (PDT)
Received: from [192.168.3.217] (c-73-241-217-19.hsd1.ca.comcast.net. [73.241.217.19])
        by smtp.gmail.com with ESMTPSA id p11sm11877708pgn.65.2021.06.08.09.23.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jun 2021 09:24:00 -0700 (PDT)
Subject: Re: [PATCH 03/16] bvec: fix the include guards for bvec.h
To:     Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Geoff Levand <geoff@infradead.org>,
        Ilya Dryomov <idryomov@gmail.com>,
        Dongsheng Yang <dongsheng.yang@easystack.cn>,
        Mike Snitzer <snitzer@redhat.com>,
        Ira Weiny <ira.weiny@intel.com>, dm-devel@redhat.com,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-block@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        ceph-devel@vger.kernel.org
References: <20210608160603.1535935-1-hch@lst.de>
 <20210608160603.1535935-4-hch@lst.de>
From:   Bart Van Assche <bvanassche@acm.org>
Message-ID: <c5e460da-1401-30c3-df87-0a033f40e563@acm.org>
Date:   Tue, 8 Jun 2021 09:23:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210608160603.1535935-4-hch@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 6/8/21 9:05 AM, Christoph Hellwig wrote:
> Fix the include guards to match the file naming.

Reviewed-by: Bart Van Assche <bvanassche@acm.org>
