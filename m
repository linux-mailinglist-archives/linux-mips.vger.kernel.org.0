Return-Path: <linux-mips+bounces-14314-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id C6EwF33B7GmDcQAAu9opvQ
	(envelope-from <linux-mips+bounces-14314-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sat, 25 Apr 2026 15:28:29 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BB74667EF
	for <lists+linux-mips@lfdr.de>; Sat, 25 Apr 2026 15:28:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A0803300421D
	for <lists+linux-mips@lfdr.de>; Sat, 25 Apr 2026 13:28:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B9C036495F;
	Sat, 25 Apr 2026 13:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Byz97KSu"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B7948CFC;
	Sat, 25 Apr 2026 13:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777123704; cv=none; b=rk5a/Ss7zi4ag+yEsKi3znh/QOuKeY8916ic5Go+k8Xf/Y28OeMH7MvMhXZP/lcghfcG185WNwwX3DIoUtl9uMLAPmCsgaOAf34YDYmXbYKEEDdlisRCAQDK4n1izJW2Jgjuko7B6qjsBwFuGRj0Ct2bYAHjfM/lza8oK64RT0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777123704; c=relaxed/simple;
	bh=RpVYcg4z4nIQKAhR9yXzFiSfQ4/6e/Se/DGml1cZ7kI=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=KM4aZD4bqWmbE/p3kUzUeFy1B8YlDJbP8pgW+YDNV4EQbl55KMgx3AF8ki75Ka8d7Fg0wGQpOVnQDk0YZz77Eh4G6gpnnRXa1WAZXXmid7gbKN7tsWR4cZPcbNKdyzt5Bj35+/iCoTGU3cTB7wkug0dka+ADXjWXu/FNxagK0zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Byz97KSu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B0C1C2BCB0;
	Sat, 25 Apr 2026 13:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777123703;
	bh=RpVYcg4z4nIQKAhR9yXzFiSfQ4/6e/Se/DGml1cZ7kI=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Byz97KSum+2En1+WWGicqm+WTFaszrCiFj/WvOwSKtKHje512GdjSWYieGPNdJzrJ
	 MjGBCrRZpq+0R1FEu/W/cXb7FxNbxKxrVaGo/dQX7gwURqA3qhfE8oqIqyEAF2oogy
	 fH/dpTqksNbvcUFxJtIvnEiwyoQi9+/F75iXxzvnDJ1nscyVK5gLzVCYoACxj8lgEo
	 sjuaihNB/Kn3+jy7BD4BI/umAWcVtJFPkdinC3VFGaa2Tijd7n62ycCOXpAFy4BnqA
	 n/EuKvfd4aRevSy4du+VQ9B5M09bD0v/92KT26GygZPbK+FYVLBkH6VvQ5XcX4nCgY
	 t8rhYDKja4WbQ==
Date: Sat, 25 Apr 2026 08:28:21 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: tglx@kernel.org, conor+dt@kernel.org, linux-mips@vger.kernel.org, 
 krzk+dt@kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
To: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <20260425123531.270548-2-cjd@cjdns.fr>
References: <20260425123531.270548-1-cjd@cjdns.fr>
 <20260425123531.270548-2-cjd@cjdns.fr>
Message-Id: <177712370148.1527749.7565214035200790095.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: interrupt-controller: econet: Add CPU
 interrupt mapping
X-Rspamd-Queue-Id: 87BB74667EF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14314-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cjdns.fr:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]


On Sat, 25 Apr 2026 12:35:30 +0000, Caleb James DeLisle wrote:
> In MIPS VEIC mode (Vectored External Interrupt Controller), the
> hardware stops directly dispatching CPU interrupts such as IPIs or CPU
> performance counters, and instead it communicates them to the external
> interrupt controller (the hardware described here) which prioritizes,
> renumbers, and integrates them with its own hardware interrupt pins.
> Interrupts from the external controller are then dispatched through a
> different method via a dispatch table. In effect, the external
> controller subsumes the CPU controller and becomes the root.
> 
> 34K Manual (MD00534) Section 6.3.1.3 rev 1.13 page 136
> 
> Since there are interrupts which ought to be controlled by the CPU
> controller driver - particularly the IPI interrupts - we create a
> reverse mapping where those interrupts may be sent back to the CPU
> intc when they are received. This maintains the fiction that there is
> still a hierarchy, and keeps the DT the same no matter whether the
> processor is in VEIC mode or not. The econet,cpu-interrupt-map is
> optional and if omitted, it's assumed that no interrupts need to be
> mapped.
> 
> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
> ---
>  .../econet,en751221-intc.yaml                 | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/interrupt-controller/econet,en751221-intc.yaml: ignoring, error in schema: properties: econet,cpu-interrupt-map: items
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/interrupt-controller/econet,en751221-intc.yaml: properties:econet,cpu-interrupt-map:items: 'anyOf' conditional failed, one must be fixed:
	{'items': ['The interrupt number which will be received in this controller', 'The interrupt number which must then be dispatched on the CPU intc']} is not of type 'array'
	/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/interrupt-controller/econet,en751221-intc.yaml: properties:econet,cpu-interrupt-map:items:items: 'anyOf' conditional failed, one must be fixed:
		['The interrupt number which will be received in this controller', 'The interrupt number which must then be dispatched on the CPU intc'] is not of type 'object', 'boolean'
		'The interrupt number which will be received in this controller' is not of type 'object', 'boolean'
		'The interrupt number which must then be dispatched on the CPU intc' is not of type 'object', 'boolean'
Traceback (most recent call last):
  File "/usr/local/bin/dt-doc-validate", line 8, in <module>
    sys.exit(main())
             ~~~~^^
  File "/usr/local/lib/python3.13/dist-packages/dtschema/doc_validate.py", line 66, in main
    ret |= check_doc(f)
           ~~~~~~~~~^^^
  File "/usr/local/lib/python3.13/dist-packages/dtschema/doc_validate.py", line 37, in check_doc
    dtsch.check_schema_refs()
    ~~~~~~~~~~~~~~~~~~~~~~~^^
  File "/usr/local/lib/python3.13/dist-packages/dtschema/schema.py", line 241, in check_schema_refs
    self._check_schema_refs(resolver, self)
    ~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^
  File "/usr/local/lib/python3.13/dist-packages/dtschema/schema.py", line 212, in _check_schema_refs
    self._check_schema_refs(resolver, v, parent=k, is_common=is_common,
    ~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
                            has_constraint=has_constraint)
                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/lib/python3.13/dist-packages/dtschema/schema.py", line 216, in _check_schema_refs
    self._check_schema_refs(resolver, schema[i], parent=parent, is_common=is_common,
    ~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
                            has_constraint=has_constraint)
                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/lib/python3.13/dist-packages/dtschema/schema.py", line 203, in _check_schema_refs
    ref_sch = resolver.lookup(schema['$ref']).contents
              ~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^
  File "/usr/local/lib/python3.13/dist-packages/referencing/_core.py", line 682, in lookup
    retrieved = self._registry.get_or_retrieve(uri)
  File "/usr/local/lib/python3.13/dist-packages/referencing/_core.py", line 422, in get_or_retrieve
    registry = self.crawl()
  File "/usr/local/lib/python3.13/dist-packages/referencing/_core.py", line 500, in crawl
    id = resource.id()
  File "/usr/local/lib/python3.13/dist-packages/referencing/_core.py", line 231, in id
    id = self._specification.id_of(self.contents)
  File "/usr/local/lib/python3.13/dist-packages/referencing/jsonschema.py", line 50, in _dollar_id
    return contents.get("$id")
           ^^^^^^^^^^^^
AttributeError: 'str' object has no attribute 'get'
Documentation/devicetree/bindings/interrupt-controller/econet,en751221-intc.example.dtb: /example-0/interrupt-controller@1fb40000: failed to match any schema with compatible: ['econet,en751221-intc']

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260425123531.270548-2-cjd@cjdns.fr

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


