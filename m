Return-Path: <linux-mips+bounces-12790-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 78744D0642C
	for <lists+linux-mips@lfdr.de>; Thu, 08 Jan 2026 22:20:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E60F53079D15
	for <lists+linux-mips@lfdr.de>; Thu,  8 Jan 2026 21:18:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54D83337BBC;
	Thu,  8 Jan 2026 21:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eg6hT7FG";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="YQ12ZwiP"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94EC3358D3
	for <linux-mips@vger.kernel.org>; Thu,  8 Jan 2026 21:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767907082; cv=none; b=nfyLTRFXlcvlEt9ve/hHw2qdY/FhqQPcliZwFNQumkhS62AZmksd5N+SvVHJzSVsfyS4O/GNTyag6ak37XZfVhBqba2w65dMe4LWB2hdH3zbtTqiC4cfBJWXuSLX7aX/vzP+kDDZKcIVvVEkshn84qud33610YtwSRqobqMAXks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767907082; c=relaxed/simple;
	bh=POUeZsY+F8+kUE271cgqQ9Np90bcd9LYX6PjbgvcBJw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mnldJZUF/LJw2yitAK0H4Km8xS4LTbC4087LTjpOxHkaoqb7J722NCw77+59XrfMQSyLFe0uSK8kLT/UiHt7k3X/sxcTut7EqrHjC/kUKBsPEFAdvHb2fGvyL2lhZpXmTDwbplPd1i7OYdZ2ND2IsxOm8J3KvZ7EEdzpjNQk5C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eg6hT7FG; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=YQ12ZwiP; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767907074;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kJHSitOCa2lb+eZDZlB0ZfwPqPo8SqKK/IbMApuY5hc=;
	b=eg6hT7FGLDQiqhk2+jxS6UYyQTlP9oPPUbL9EfCXJvO42tEoeG141kM5qDSaBTMtzqPEb/
	qGZTgVOckK+xIW+tWZLdE4nm3tkoW9IlFuDRh9+2F9SUQDKNpjwYhqpYBud/ApIv/7UyQ0
	pxW25phzVPw4Sb55OPzZ50VrcT+kyBk=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-295-_9uCYTVkOjWoervE3kRRwQ-1; Thu, 08 Jan 2026 16:17:53 -0500
X-MC-Unique: _9uCYTVkOjWoervE3kRRwQ-1
X-Mimecast-MFC-AGG-ID: _9uCYTVkOjWoervE3kRRwQ_1767907073
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-93f69d06fe4so3664202241.0
        for <linux-mips@vger.kernel.org>; Thu, 08 Jan 2026 13:17:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767907073; x=1768511873; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kJHSitOCa2lb+eZDZlB0ZfwPqPo8SqKK/IbMApuY5hc=;
        b=YQ12ZwiPe0hsyVJRobJQAkaPljKvKXxRnQG5ZJYlS/B9gyFCYFW1IVQ6iE2ssZXdg+
         JYccZkuZyK38+EF89bfwoliW7TVUsIzO/DUkQGCrJabbi97jlDQqm+Mp4K56uPGRqf/m
         TTRnBc0oe2NyIXyXJqgreeVteQlvhV5Qt+S+dJXggwxUpMiOUne1ih/TIvpItlvtNkJE
         F3yv88+qs/d13KBlbUmWZKtQ0Hef/yN5P7PYGnYZg+fgLYHJZFQeynPJhqdtGIrgfrjU
         UAxcI4/k3AuwVvX6ij0FqfoaFEnUbyeSdxJzYHnnpTQleR1P2IQXkHabC8Qaf0fQncX7
         eaXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767907073; x=1768511873;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kJHSitOCa2lb+eZDZlB0ZfwPqPo8SqKK/IbMApuY5hc=;
        b=e8AOQSh28QUkktT+Z77pRX9ElbfjXjivBzUsX3qZouvlLiXGiY2GIHqvu71MltcBqn
         BsGKSks247CO08Zr9I+Tm1QQEvWh/x35M8ZOIc94eiPeDtizDUXzh0FXrZaSCVASG1Jc
         WP3R5XYmZ9eC1UwTD/w38pV+RW3Hzsrm7qFC4qFC3ZAl5tlYy3+eEhScrljP8BSeoFAM
         hed/hMlBy2Ayxio9TWFDM9+e0ayP1ZFY399P5+Fny5lTQAFp5dvCh7VrMsHkbfdtwwFl
         gWCL+jXwsadnL50/4/TJeqn1szwNFqSXH1x1vkOJgwW905GkyQMdaVoSI86mcErjYVB2
         CZzA==
X-Forwarded-Encrypted: i=1; AJvYcCWIc2eDOEGmHZMlnjusfNcuTGFWJsto1GzTWrK+axIioomzAuAPo2G0kmmxIL/cx27TDQMy1gBv3sTp@vger.kernel.org
X-Gm-Message-State: AOJu0YzqYdvQ7WxMl2Op2vFc9BCqeWqoyiGfNuy6sj8Kwlt1K/PLZ6j8
	4UbRIpLnikXGgA5S35G7Rkfb+zui4FCe0HeSKDy7+JTrhox9+YKWuU9/BU3/hROXh0GvAxNRzuG
	tLOq5X8T6okNh0dZJ+ezqgiI3gwlWXsZUHOs6Z6TpVLXOv8tcDu90TrjTsIlqw1fYSf4uT3U=
X-Gm-Gg: AY/fxX4XuInX7qiImBWzcXiLGUx3FMa9Ux3xrAks86f/1l8aIGuwGIPo1Xf1BjUa/P8
	d6lx4zoJ3fMbI9z/th4fyEplBhJGPYJGuJdYvXsY8x5mA9x0MPjjomm4bP/iLwU+/+h2cFRhN8d
	KK1nSp//zao2pJpo3WpPBOXmyhziqVn51OqmYw9El5CLrcWmrLFxc152jhbbogbOyeL9/kaT7Ug
	gYvffpvkrdXpWfFlXIFqT7RZucT+4l894/VGwpn0zl9qWX13zFkPJGVGR5E8uU+5m5ucf00eGGF
	DLsCBFFgUygx6nz7qwlqe8tRKew79s2QQNgDUCAxqAJBjeJ/AtvSw1F76M11iF+iSOl3PNhV4J/
	9vQEQl/tteCdh6GI=
X-Received: by 2002:a05:6102:38ca:b0:5db:f352:afc0 with SMTP id ada2fe7eead31-5ecb1e72945mr2984427137.2.1767907072885;
        Thu, 08 Jan 2026 13:17:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG8lwBGoZzalWApFS6fBt0yhs9PqwqWvGlooSRhdR5zfpfZTC31pKCqamm2uqiTNXnx/ioL4Q==
X-Received: by 2002:a05:6102:38ca:b0:5db:f352:afc0 with SMTP id ada2fe7eead31-5ecb1e72945mr2984416137.2.1767907072569;
        Thu, 08 Jan 2026 13:17:52 -0800 (PST)
Received: from [10.30.226.224] ([2600:382:811f:d757:daa5:b867:12a3:9d12])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ec77064e86sm7623329137.7.2026.01.08.13.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 13:17:51 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 08 Jan 2026 16:16:27 -0500
Subject: [PATCH 09/27] clk: loongson1: convert from divider_round_rate() to
 divider_determine_rate()
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-clk-divider-round-rate-v1-9-535a3ed73bf3@redhat.com>
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
In-Reply-To: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, Keguang Zhang <keguang.zhang@gmail.com>, 
 linux-mips@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1454; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=POUeZsY+F8+kUE271cgqQ9Np90bcd9LYX6PjbgvcBJw=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIT5LYHN79l2mZlWP1eiTViw4Ffutcmduqz/1K/Y61xg
 F8n5L1lRykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABNZ4sfwT1n/t8Kspn/BRVU7
 7qxqL3ExZ2mqzJCLlr+ruXvP9skd4Qz/bNpEnLodlkwyLqjufyw1RS4xw3lR4du3G9bM/2G0/v8
 KPgA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

The divider_round_rate() function is now deprecated, so let's migrate
to divider_determine_rate() instead so that this deprecated API can be
removed.

Note that when the main function itself was migrated to use
determine_rate, this was mistakenly converted to:

    req->rate = divider_round_rate(...)

This is invalid in the case when an error occurs since it can set the
rate to a negative value.

Fixes: bb40a2ef4fc9 ("clk: loongson1: convert from round_rate() to determine_rate()")
Signed-off-by: Brian Masney <bmasney@redhat.com>

---
To: Keguang Zhang <keguang.zhang@gmail.com>
Cc: linux-mips@vger.kernel.org
---
 drivers/clk/clk-loongson1.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/clk/clk-loongson1.c b/drivers/clk/clk-loongson1.c
index f9f060d08a5fae3291a9408c6dc93531b435609f..1674181a1107dc4f30e78ee410a55a49b6d0b4b5 100644
--- a/drivers/clk/clk-loongson1.c
+++ b/drivers/clk/clk-loongson1.c
@@ -99,10 +99,7 @@ static int ls1x_divider_determine_rate(struct clk_hw *hw,
 	struct ls1x_clk *ls1x_clk = to_ls1x_clk(hw);
 	const struct ls1x_clk_div_data *d = ls1x_clk->data;
 
-	req->rate = divider_round_rate(hw, req->rate, &req->best_parent_rate,
-				       d->table, d->width, d->flags);
-
-	return 0;
+	return divider_determine_rate(hw, req, d->table, d->width, d->flags);
 }
 
 static int ls1x_divider_set_rate(struct clk_hw *hw, unsigned long rate,

-- 
2.52.0


