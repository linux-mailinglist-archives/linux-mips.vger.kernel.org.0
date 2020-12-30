Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E9662E7CAC
	for <lists+linux-mips@lfdr.de>; Wed, 30 Dec 2020 22:27:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726422AbgL3V0w (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 30 Dec 2020 16:26:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726365AbgL3V0v (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 30 Dec 2020 16:26:51 -0500
Received: from yawp.biot.com (yawp.biot.com [IPv6:2a01:4f8:10a:8e::fce2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2D5AC061799
        for <linux-mips@vger.kernel.org>; Wed, 30 Dec 2020 13:26:11 -0800 (PST)
Received: from debian-spamd by yawp.biot.com with sa-checked (Exim 4.93)
        (envelope-from <bert@biot.com>)
        id 1kuiyw-00Am1x-14
        for linux-mips@vger.kernel.org; Wed, 30 Dec 2020 22:26:10 +0100
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on yawp
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.4
Received: from [2a02:578:460c:1:ae1f:6bff:fed1:9ca8]
        by yawp.biot.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <bert@biot.com>)
        id 1kuiyn-00Am1F-Ja; Wed, 30 Dec 2020 22:26:01 +0100
Subject: Re: [PATCH v3 1/4] Add support for Realtek RTL838x/RTL839x switch
 SoCs
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>,
        Sander Vanheule <sander@svanheule.net>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Birger Koblitz <mail@birger-koblitz.de>,
        John Crispin <john@phrozen.org>
References: <20201230212205.2605383-1-bert@biot.com>
From:   Bert Vermeulen <bert@biot.com>
Message-ID: <4a000db7-54e5-76c7-7a1f-7c4c9b6b2c22@biot.com>
Date:   Wed, 30 Dec 2020 22:26:01 +0100
MIME-Version: 1.0
In-Reply-To: <20201230212205.2605383-1-bert@biot.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 12/30/20 10:22 PM, Bert Vermeulen wrote:
> The RTL838x/839x family of SoCs are Realtek switches with an embedded
> MIPS core.

Oops, forgot patch version note:

v3:
- all code removed, the base system is now only device tree files and docs
   and some build config.
- ioremap.h restored to the v1 version, with hardcoded I/O ranges, since I
   got flak on changing that as suggested. This brings it in line with other
   systems in arch/mips/generic.


-- 
Bert Vermeulen
bert@biot.com
