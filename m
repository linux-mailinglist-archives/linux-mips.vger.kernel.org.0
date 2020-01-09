Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 864AC136089
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jan 2020 19:52:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732103AbgAISwn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 Jan 2020 13:52:43 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:39172 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730273AbgAISwn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 9 Jan 2020 13:52:43 -0500
Received: by mail-pl1-f194.google.com with SMTP id g6so2907384plp.6
        for <linux-mips@vger.kernel.org>; Thu, 09 Jan 2020 10:52:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:to:cc:cc:cc:subject
         :references:in-reply-to;
        bh=eVL3zTAecPc4LEpusoz2VSzgeFUWorYwv/nWYXrAZKw=;
        b=RhbFB1rHqQZgsakZNNjp5wzmKegRNb9aMlN/YCFqDNAmuorezIj5a9q26wog68S/Q+
         fV9MwuqJNJmEoxPhNi5YBCpuGjqFIxK6CMl78MgAxZ9SwrjdtY0L++OSRXwBOxBECUyK
         SA7Nl5j4m6E+JMMljZvDbphGFJkvRG/onVLD0o5L2FASiRwKMe7OWHuCMTasaNqznaok
         0EXl8fHwZ62RhUEoGc7yqSmlgci1X0b1KA/sjGARFgAaMfTpEr65+w1Gbsa4AjQeDfpi
         Ldj9Ms/I806RKp5QYJnmTfHlFv7mKP4cf78yV+pajldA26iP8v8pIu2bINTu4nbXbZgn
         Zrpw==
X-Gm-Message-State: APjAAAVNYc8b6yJbsOl883YAe6pzXyynBcZHACaKdRVegnlA3liIJ2uy
        NqCySNu5fn3No2VS85djpR4=
X-Google-Smtp-Source: APXvYqzvIdt1J2W7ljgKp8uls9FNyUBvaDJ6lm9djRJ54bz2UAjFqG+7mprtUv8lnDoIJbhMESR8SQ==
X-Received: by 2002:a17:90b:d94:: with SMTP id bg20mr6758008pjb.99.1578595962812;
        Thu, 09 Jan 2020 10:52:42 -0800 (PST)
Received: from localhost (MIPS-TECHNO.ear1.SanJose1.Level3.net. [4.15.122.74])
        by smtp.gmail.com with ESMTPSA id v4sm8176051pff.174.2020.01.09.10.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2020 10:52:42 -0800 (PST)
Message-ID: <5e17767a.1c69fb81.6709a.515f@mx.google.com>
Date:   Thu, 09 Jan 2020 10:52:41 -0800
From:   Paul Burton <paulburton@kernel.org>
To:     James Hogan <jhogan@kernel.org>
CC:     Paul Burton <paulburton@kernel.org>
CC:     James Hogan <jhogan@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>, linux-mips@vger.kernel.org
CC:     linux-mips@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Drop James Hogan as MIPS maintainer
References:  <20191219141658.43818-1-jhogan@kernel.org>
In-Reply-To:  <20191219141658.43818-1-jhogan@kernel.org>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

James Hogan wrote:
> I haven't been active for 18 months, and Paul seems to be doing a grand
> job, so drop me from MIPS maintainership.

Applied to mips-next.

> commit 9c48c48cd499
> https://git.kernel.org/mips/c/9c48c48cd499
> 
> Signed-off-by: James Hogan <jhogan@kernel.org>
> Signed-off-by: Paul Burton <paulburton@kernel.org>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paulburton@kernel.org to report it. ]
